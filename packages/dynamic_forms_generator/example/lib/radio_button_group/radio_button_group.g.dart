// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class RadioButtonGroup extends SingleSelectGroup<RadioButton> {
  static const String arrangementPropertyName = "arrangement";

  String get arrangement => properties[arrangementPropertyName].value;
  Stream<String> get arrangementChanged => properties[arrangementPropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<RadioButton>> choices,
    @required ElementValue<String> value,
    @required ElementValue<String> arrangement,
  }) {
  }

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
