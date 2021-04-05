import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;

class SimpleFormJson extends StatefulWidget {
  @override
  _SimpleFormJsonState createState() => _SimpleFormJsonState();
}

class _SimpleFormJsonState extends State<SimpleFormJson> {
  bool isLoading = true;
  late String fileContent;

  @override
  void initState() {
    super.initState();
    _buildForm();
  }

  Future _buildForm() async {
    fileContent =
        await rootBundle.loadString('assets/test_form1.json', cache: false);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dynamic form parsed from JSON'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : ParsedFormProvider(
                  create: (_) => JsonFormManager(),
                  content: fileContent,
                  parsers: components.getDefaultParserList(),
                  child: FormRenderer<JsonFormManager>(
                    renderers: components.getRenderers(),
                  ),
                ),
        ),
      ),
    );
  }
}
