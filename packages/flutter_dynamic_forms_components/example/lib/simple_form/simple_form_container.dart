import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/form_parser_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class SimpleFormContainer extends StatefulWidget {
  final FormParserType formParserType;

  const SimpleFormContainer({Key key, this.formParserType}) : super(key: key);

  @override
  _SimpleFormContainerState createState() => _SimpleFormContainerState();
}

class _SimpleFormContainerState extends State<SimpleFormContainer> {
  FormRenderService _formRenderService;
  FormManager _formManager;
  FormElement _form;

  @override
  void initState() {
    super.initState();
    _formRenderService = FormRenderService(
      renderers: getReactiveRenderers(),
      dispatcher: _onFormElementEvent,
    );
    switch (widget.formParserType) {
      case FormParserType.xml:
        _loadFormFromXml();
        break;
      case FormParserType.json:
        _loadFormFromJson();
        break;
    }
  }

  Future _loadFormFromXml() {
    return _loadForm(
      "assets/test_form1.xml",
      XmlFormParserService(
        getDefaultParserList(),
      ),
    );
  }

  Future _loadFormFromJson() {
    return _loadForm(
      "assets/test_form1.json",
      JsonFormParserService(
        getDefaultParserList(),
      ),
    );
  }

  Future _loadForm(String fileName, FormParserService formParserService) async {
    var formManagerBuilder = FormManagerBuilder(formParserService);

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
    if (_form == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: _formRenderService.render(_form, context),
      ),
    );
  }
}
