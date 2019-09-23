import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class RequiredValidation extends Validation {
  void fillRequiredValidation({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isValid,
    @required ElementValue<String> message,
  }) {
    fillValidation(
      id: id,
      parent: parent,
      isVisible: isVisible,
      message: message,
      isValid: isValid,
    );
  }

  @override
  FormElement getInstance() {
    return RequiredValidation();
  }
}
