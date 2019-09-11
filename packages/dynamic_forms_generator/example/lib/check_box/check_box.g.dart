// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class CheckBox extends FormElement {
  static const String valuePropertyName = "value";
  static const String labelPropertyName = "label";

  bool get value => properties[valuePropertyName].value;
  Stream<bool> get valueChanged => properties[valuePropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
