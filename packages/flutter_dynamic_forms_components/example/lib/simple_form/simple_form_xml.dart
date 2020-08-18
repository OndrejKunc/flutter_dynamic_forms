import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;

class SimpleFormXml extends StatefulWidget {
  @override
  _SimpleFormXmlState createState() => _SimpleFormXmlState();
}

class _SimpleFormXmlState extends State<SimpleFormXml> {
  bool isLoading = true;
  String fileContent;

  @override
  void initState() {
    super.initState();
    _buildForm();
  }

  Future _buildForm() async {
    fileContent =
        await rootBundle.loadString('assets/test_form1.xml', cache: false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dynamic form parsed from XML'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : ParsedFormProvider(
                  create: (_) => XmlFormManager(),
                  content: fileContent,
                  parsers: components.getDefaultParserList(),
                  child: FormRenderer<XmlFormManager>(
                    renderers: components.getReactiveRenderers(),
                  ),
                ),
        ),
      ),
    );
  }
}
