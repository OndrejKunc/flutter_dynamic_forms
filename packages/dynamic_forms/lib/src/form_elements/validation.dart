import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class Validation extends FormElement {
  ElementValue<bool> isValid;
  ElementValue<String> message;

  void fillValidation({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<bool> isValid,
    @required ElementValue<String> message,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.isValid = registerElementValue("isValid", isValid);
    this.message = registerElementValue("message", message);
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = Validation();
    result.fillValidation(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      isValid: this.isValid.clone(),
      message: this.message.clone(),
    );
    return result;
  }
}
