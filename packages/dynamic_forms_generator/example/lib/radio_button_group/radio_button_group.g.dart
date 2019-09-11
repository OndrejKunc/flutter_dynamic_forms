// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonGroup extends SingleSelectGroup<RadioButton> {
  static const String arrangementPropertyName = "arrangement";

  String get arrangement => properties[arrangementPropertyName].value;
  Stream<String> get arrangementChanged => properties[arrangementPropertyName].valueChanged;

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
