import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:meta/meta.dart';
import 'property_names.dart';

class Validation extends FormElement {
  bool get isValid => properties[IS_VALID_PROPERTY_NAME].value;
  Stream get isValidChanged => properties[IS_VALID_PROPERTY_NAME].valueChanged;
  String get message => properties[MESSAGE_PROPERTY_NAME].value;
  Stream get messageChanged => properties[MESSAGE_PROPERTY_NAME].valueChanged;
  
  void fillValidation({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isValid,
    @required ElementValue<String> message,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(IS_VALID_PROPERTY_NAME, isValid);
    registerElementValue(MESSAGE_PROPERTY_NAME, message);
  }

  @override
  FormElement getInstance() {
    return Validation();
  }
}
