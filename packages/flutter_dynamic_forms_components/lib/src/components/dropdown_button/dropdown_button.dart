import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/dropdown_option/dropdown_option.dart';
import 'package:meta/meta.dart';

class DropdownButton extends FormElement {
  static const String optionsPropertyName = "options";
  static const String valuePropertyName = "value";

  List<DropdownOption> get options => properties[optionsPropertyName].value;
  Stream<List<DropdownOption>> get optionsChanged =>
      properties[optionsPropertyName].valueChanged;
  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillDropdownButton({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<DropdownOption>> options,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(optionsPropertyName, options);
    registerElementValue(valuePropertyName, value);
  }

  @override
  FormElement getInstance() {
    return DropdownButton();
  }
}
