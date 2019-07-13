import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:dynamic_forms/src/form_elements/radio_button.dart';
import 'package:meta/meta.dart';

class RadioButtonGroup extends FormElement {
  static const String VALUE_PROPERTY_NAME = "value";
  static const String RADIO_BUTTONS_PROPERTY_NAME = "radioButtons";

  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream<String> get valueChanged =>
      properties[VALUE_PROPERTY_NAME].valueChanged;
  List<RadioButton> get radioButtons =>
      properties[RADIO_BUTTONS_PROPERTY_NAME].value;
  Stream<List<RadioButton>> get radioButtonsChanged =>
      properties[RADIO_BUTTONS_PROPERTY_NAME].valueChanged;

  void fillRadioButtonGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<RadioButton>> radioButtons,
    @required ElementValue<String> value,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(RADIO_BUTTONS_PROPERTY_NAME, radioButtons);
    registerElementValue(VALUE_PROPERTY_NAME, value);
  }

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
