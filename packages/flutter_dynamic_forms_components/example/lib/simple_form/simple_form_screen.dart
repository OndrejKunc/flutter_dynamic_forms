import 'package:example/form_parser_type.dart';
import 'package:example/simple_form/simple_form_container.dart';
import 'package:flutter/material.dart';

class SimpleFormScreen extends StatelessWidget {
  final FormParserType formParserType;

  const SimpleFormScreen({Key key, this.formParserType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Simple dynamic form parsed from ${formParserType.toString().split('.').last}'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SimpleFormContainer(
            formParserType: formParserType,
          ),
        ),
      ),
    );
  }
}
