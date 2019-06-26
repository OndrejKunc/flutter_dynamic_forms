import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/validation.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class RequiredValidation extends Validation {
  void fillRequiredValidation({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> message,
  }) {
    fillValidation(
      id: id,
      parent: parent,
      isVisible: isVisible,
      message: message,
      isValid: getIsValid(parent),
    );
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    var result = RequiredValidation();
    result.fillValidation(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      isValid: getIsValid(parent),
      message: this.message.clone(),
    );
    return result;
  }
  
  LazyExpressionElementValue<bool> getIsValid(ElementValue<ExpressionProviderElement> parent) {
    return LazyExpressionElementValue(
      () => LessThanExpression(
            ConstantExpression(Integer(0)),
            LengthFunctionExpression(
              DelegateExpression(
                ["parent"],
                parent.value.getExpressionProvider(),
              ),
            ),
          ),
    );
  }

}
