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
  bool isLoading = true;
  late String xml;

  @override
  void initState() {
    super.initState();
    loadForm();
  }

  Future loadForm() async {
    xml = await rootBundle.loadString('assets/test_form1.xml', cache: false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dynamic form'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ParsedFormProvider(
                create: (_) => XmlFormManager(),
                content: xml,
                parsers: [
                  ContainerParser(),
                  LabelParser(),
                  TextFieldParser(),
                  ValidationParser(),
                  RequiredValidationParser(),
                ],
                child: FormRenderer<XmlFormManager>(
                  renderers: [
                    ContainerRenderer(),
                    LabelRenderer(),
                    TextFieldRenderer(),
                  ],
                ),
              ),
      ),
    );
  }
}
