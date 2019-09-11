// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class FormGroup extends Container {
  static const String namePropertyName = "name";

  String get name => properties[namePropertyName].value;
  Stream<String> get nameChanged => properties[namePropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
