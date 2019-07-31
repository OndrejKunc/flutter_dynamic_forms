import 'package:example/simple_form/simple_form_container.dart';
import 'package:flutter/material.dart';

class SimpleFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple dynamic form'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SimpleFormContainer(),
        ),
      ),
    );
  }
}
