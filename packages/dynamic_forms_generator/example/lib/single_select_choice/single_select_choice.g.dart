// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChoice extends FormElement {
  static const String valuePropertyName = "value";
  static const String labelPropertyName = "label";

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return SingleSelectChoice();
  }
}
