import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/form_parser_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart' as components;

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
      renderers: components.getReactiveRenderers(),
      dispatcher: _onFormElementEvent,
    );

    var parsers = components.getDefaultParserList();
    String fileName;
    FormParserService parserService;

    switch (widget.formParserType) {
      case FormParserType.xml:
        fileName = "assets/test_form1.xml";
        parserService = XmlFormParserService(parsers);
        break;
      case FormParserType.json:
        fileName = "assets/test_form1.json";
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
