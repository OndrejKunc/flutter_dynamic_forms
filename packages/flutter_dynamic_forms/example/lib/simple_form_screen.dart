import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/components/container/container_parser.dart';
import 'package:example/components/container/container_renderer.dart';
import 'package:example/components/label/label_parser.dart';
import 'package:example/components/label/label_renderer.dart';
import 'package:example/components/required_validation/required_validation_parser.dart';
import 'package:example/components/text_field/text_field_parser.dart';
import 'package:example/components/text_field/text_field_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class SimpleFormScreen extends StatefulWidget {
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
    _formRenderService = FormRenderService(
      renderers: [
        ContainerRenderer(),
        LabelRenderer(),
        TextFieldRenderer(),
      ],
      dispatcher: _onFormElementEvent,
    );

    _loadForm();
  }

  Future _loadForm() async {
    var formManagerBuilder = FormManagerBuilder(
      XmlFormParserService([
        ContainerParser(),
        LabelParser(),
        TextFieldParser(),
        ValidationParser(),
        RequiredValidationParser(),
      ]),
    );

    var xml =
        await rootBundle.loadString('assets/test_form1.xml', cache: false);
    _formManager = formManagerBuilder.build(xml);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dynamic form'),
      ),
      body: Center(
        child: _form == null
            ? CircularProgressIndicator()
            : _formRenderService.render(_form, context),
      ),
    );
  }
}
