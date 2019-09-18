import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Validation extends FormElement {
  static const String isValidPropertyName = "isValid";
  static const String messagePropertyName = "message";

  bool get isValid => properties[isValidPropertyName].value;
  Stream<bool> get isValidChanged =>
      properties[isValidPropertyName].valueChanged;
  String get message => properties[messagePropertyName].value;
  Stream<String> get messageChanged =>
      properties[messagePropertyName].valueChanged;

  void fillValidation({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isValid,
    @required ElementValue<String> message,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(isValidPropertyName, isValid);
    registerElementValue(messagePropertyName, message);
  }

  @override
  FormElement getInstance() {
    return Validation();
  }
}
