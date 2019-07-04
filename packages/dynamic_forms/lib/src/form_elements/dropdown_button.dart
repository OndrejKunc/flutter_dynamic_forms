import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/dropdown_option.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:meta/meta.dart';

class DropdownButton extends FormElement {
  static const OPTIONS_PROPERTY_NAME = "options";
  static const String VALUE_PROPERTY_NAME = "value";

  List<DropdownOption> get options => properties[OPTIONS_PROPERTY_NAME].value;
  Stream get optionsChanged => properties[OPTIONS_PROPERTY_NAME].valueChanged;
  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream get valueChanged => properties[VALUE_PROPERTY_NAME].valueChanged;

  void fillDropdownButton({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<DropdownOption>> options,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(OPTIONS_PROPERTY_NAME, options);
    registerElementValue(VALUE_PROPERTY_NAME, value);
  }

  @override
  FormElement getInstance() {
    return DropdownButton();
  }
}
