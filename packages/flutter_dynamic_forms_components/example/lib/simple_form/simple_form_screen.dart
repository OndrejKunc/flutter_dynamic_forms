import 'package:expression_language/expression_language.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_event.dart';
import 'package:example/components/copy_container/copy_container_parser.dart';
import 'package:example/components/copy_container/copy_container_renderer.dart';
import 'package:example/form_parser_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;

class SimpleFormScreen extends StatefulWidget {
  final FormParserType formParserType;

  const SimpleFormScreen({Key key, this.formParserType}) : super(key: key);

  @override
  _SimpleFormScreenState createState() => _SimpleFormScreenState();
}

class _SimpleFormScreenState extends State<SimpleFormScreen> {
  FormRenderService _formRenderService;
  FormManager _formManager;
  FormElement _form;

  @override
  void initState() {
    super.initState();
    _buildForm();
  }

  Future _buildForm() async {
    _formRenderService = FormRenderService(
      renderers: [
        ...components.getReactiveRenderers(),
        CopyContainerRenderer()
      ],
      dispatcher: _onFormElementEvent,
    );

    var parsers = [...components.getDefaultParserList(), CopyContainerParser()];
    String fileName;
    FormParserService parserService;

    switch (widget.formParserType) {
      case FormParserType.xml:
        fileName = 'assets/test_form1.xml';
        parserService = XmlFormParserService(parsers);
        break;
      case FormParserType.json:
        fileName = 'assets/test_form1.json';
        parserService = JsonFormParserService(parsers);
        break;
    }

    var formManagerBuilder = FormManagerBuilder(parserService);
    var content = await rootBundle.loadString(fileName, cache: false);
    _formManager = formManagerBuilder.build(content);
    setState(() {
      _form = _formManager.form;
    });
  }

  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName,
          ignoreLastChange: event.ignoreLastChange);
    }
    if (event is CopyFirstChildEvent) {
      var children = event.copyContainer.children;
      if (children.isEmpty) {
        return;
      }

      // Create copy of the first children
      var clonedRoot = children[0].clone(null);

      var clonedElements =
          getFormElementIterator<FormElement>(clonedRoot).toList();

      // Change id of each element in the new tree
      for (var i = 0; i < clonedElements.length; i++) {
        var clonedElement = clonedElements[i];
        if (clonedElement.id == null) {
          continue;
        }
        clonedElement.id = "${clonedElement.id}_$i";
        _formManager.formElementMap[clonedElement.id] = clonedElement;
      }

      // Build expressions in the cloned subtree
      var clonedExpressions =
          getFormPropertyIterator<CloneableExpressionProperty>(clonedRoot);
      for (var expressionValue in clonedExpressions) {
        expressionValue.buildExpression(_formManager.formElementMap);
      }

      // Add subscriptions to existing expressions
      for (var expressionValue in clonedExpressions) {
        var elementsValuesCollectorVisitor =
            ExpressionProviderCollectorVisitor();
        expressionValue.getExpression().accept(elementsValuesCollectorVisitor);
        for (var sourceProperty
            in elementsValuesCollectorVisitor.expressionProviders) {
          (sourceProperty as Property).addSubscriber(expressionValue);
        }
      }

      (clonedRoot as FormElement).parentProperty = children[0].parentProperty;

      // Add back to the children list
      children.add(clonedRoot);

      // Notify view about the change
      event.copyContainer.changedSubject.add(children.length);
    }
    //No need to call setState, because reactive renderers already listen to the changes.
    //Call setState when using regular renderers, but note that the whole form will be re-rendered.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Simple dynamic form parsed from ${widget.formParserType.toString().split('.').last}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: _form == null
              ? CircularProgressIndicator()
              : _formRenderService.render(_form, context),
        ),
      ),
    );
  }
}
