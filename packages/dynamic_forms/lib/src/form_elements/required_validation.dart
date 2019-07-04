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

  LazyExpressionElementValue<bool> getIsValid(
      ElementValue<ExpressionProviderElement> parent) {
    return LazyExpressionElementValue(
      () => LessThanNumberExpression(
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

  @override
  FormElement getInstance() {
    return RequiredValidation();
  }

  @override
  ElementValue cloneProperty(
      String key,
      ElementValue oldProperty,
      ExpressionProvider<ExpressionProviderElement> parent,
      ExpressionProviderElement instance) {
    return (key == Validation.IS_VALID_PROPERTY_NAME)
        ? getIsValid(parent)
        : super.cloneProperty(key, oldProperty, parent, instance);
  }
}
