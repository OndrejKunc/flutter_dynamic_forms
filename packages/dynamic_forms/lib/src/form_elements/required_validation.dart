import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/validation.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';


class RequiredValidation extends Validation {
  void fillRequiredValidation({
    @required String id,
    @required ElementValue<ExpressionProviderElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> message,
  }) {
    fillValidation(
      id: id,
      parent: parent,
      isVisible: isVisible,
      message: message,
      isValid: LazyExpressionElementValue(() =>
        LessThanExpression(
          ConstantExpression(Integer(0)),
          LengthFunctionExpression(
            DelegateExpression(["parent"],
              parent.value.getExpressionProvider(),
            ),
          ),
        ),
      ),
    );
  }
}