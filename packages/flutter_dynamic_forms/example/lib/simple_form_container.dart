import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/components/container/container_parser.dart';
import 'package:example/components/container/container_renderer.dart';
import 'package:example/components/label/label_parser.dart';
import 'package:example/components/label/label_renderer.dart';
import 'package:example/components/required_validation/required_validation_parser.dart';
import 'package:example/components/text/text_parser.dart';
import 'package:example/components/text/text_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class SimpleFormContainer extends StatefulWidget {
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
      renderers: [
        ContainerRenderer(),
        LabelRenderer(),
        TextRenderer(),
      ],
      dispatcher: _onFormElementEvent,
    );

    _loadForm();
  }

  Future _loadForm() async {
    var formManagerBuilder = FormManagerBuilder(
      FormParserService([
        ContainerParser(),
        LabelParser(),
        TextParser(),
        ValidationParser(),
        RequiredValidationParser(),
      ]),
    );

    var xml =
        await rootBundle.loadString("assets/test_form1.xml", cache: false);
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
