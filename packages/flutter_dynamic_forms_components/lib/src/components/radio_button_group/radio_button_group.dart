import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

import '../radio_button/radio_button.dart';

class RadioButtonGroup extends FormElement {
  static const String valuePropertyName = "value";
  static const String radioButtonsPropertyName = "radioButtons";
  static const String arrangementPropertyName = "arrangement";

  String get value => properties[valuePropertyName].value;
  Stream<String> get valueChanged => properties[valuePropertyName].valueChanged;
  List<RadioButton> get radioButtons =>
      properties[radioButtonsPropertyName].value;
  Stream<List<RadioButton>> get radioButtonsChanged =>
      properties[radioButtonsPropertyName].valueChanged;

  String get arrangement => properties[arrangementPropertyName].value;
  Stream<String> get arrangementChanged =>
      properties[arrangementPropertyName].valueChanged;

  void fillRadioButtonGroup(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<RadioButton>> radioButtons,
      @required ElementValue<String> value,
      @required ElementValue<String> arrangement}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(radioButtonsPropertyName, radioButtons);
    registerElementValue(valuePropertyName, value);
    registerElementValue(arrangementPropertyName, arrangement);
  }

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
