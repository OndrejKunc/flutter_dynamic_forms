import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;

class SimpleSubmitForm extends StatefulWidget {
  @override
  _SimpleSubmitFormState createState() => _SimpleSubmitFormState();
}

class _SimpleSubmitFormState extends State<SimpleSubmitForm> {
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
        title: Text('Simple form with submit button'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: isLoading
              ? CircularProgressIndicator()
              : ParsedFormProvider(
                  create: (_) => JsonFormManager(),
                  content: fileContent,
                  parsers: components.getDefaultParserList(),
                  child: Column(
                    children: [
                      FormRenderer<JsonFormManager>(
                        renderers: components.getRenderers(),
                      ),
                      // Using Builder to obtain a BuildContext already containg JsonFormManager
                      Builder(
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              child: Text('Submit'),
                              onPressed: () {
                                var formProperties =
                                    FormProvider.of<JsonFormManager>(context)
                                        .getFormProperties();
                                _submitToServer(context, formProperties);
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _submitToServer(
      BuildContext context, List<FormPropertyValue> formProperties) {
    // Only showing dialog with the form data for demo purposes
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Form data'),
          content: Container(
            width: double.maxFinite,
            height: 300.0,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              //map List of our data to the ListView
              children: formProperties
                  .map((riv) => Text('${riv.id} ${riv.property} ${riv.value}'))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
