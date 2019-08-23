import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:meta/meta.dart';

class RadioButtonGroup extends SingleSelectGroup {
  static const String arrangementPropertyName = "arrangement";

  String get arrangement => properties[arrangementPropertyName].value;
  Stream<String> get arrangementChanged =>
      properties[arrangementPropertyName].valueChanged;

  void fillRadioButtonGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<RadioButton>> radioButtons,
    @required ElementValue<String> value,
    @required ElementValue<String> arrangement,
  }) {
    fillSingleSelectGroup(
        id: id,
        parent: parent,
        isVisible: isVisible,
        choices: radioButtons,
        value: value);
    registerElementValue(arrangementPropertyName, arrangement);
  }

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
