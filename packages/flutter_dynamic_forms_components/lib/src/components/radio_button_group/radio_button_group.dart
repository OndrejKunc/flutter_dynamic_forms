import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

import '../radio_button/radio_button.dart';

class RadioButtonGroup extends FormElement {
  static const String VALUE_PROPERTY_NAME = "value";
  static const String RADIO_BUTTONS_PROPERTY_NAME = "radioButtons";
  static const String ARRANGEMENT_PROPERTY_NAME = "arrangement";

  String get value => properties[VALUE_PROPERTY_NAME].value;
  Stream<String> get valueChanged =>
      properties[VALUE_PROPERTY_NAME].valueChanged;
  List<RadioButton> get radioButtons =>
      properties[RADIO_BUTTONS_PROPERTY_NAME].value;
  Stream<List<RadioButton>> get radioButtonsChanged =>
      properties[RADIO_BUTTONS_PROPERTY_NAME].valueChanged;

  String get arrangement => properties[ARRANGEMENT_PROPERTY_NAME].value;
  Stream<String> get arrangementChanged =>
      properties[ARRANGEMENT_PROPERTY_NAME].valueChanged;

  void fillRadioButtonGroup(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<RadioButton>> radioButtons,
      @required ElementValue<String> value,
      @required ElementValue<String> arrangement}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(RADIO_BUTTONS_PROPERTY_NAME, radioButtons);
    registerElementValue(VALUE_PROPERTY_NAME, value);
    registerElementValue(ARRANGEMENT_PROPERTY_NAME, arrangement);
  }

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
