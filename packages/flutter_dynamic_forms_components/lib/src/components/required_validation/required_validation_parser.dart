import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

import '../required_validation/required_validation.dart';

class RequiredValidationParser extends FormElementParser<RequiredValidation> {
  @override
  String get name => "requiredValidation";

  @override
  RequiredValidation parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    RequiredValidation validation = RequiredValidation();
    validation.fillRequiredValidation(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      isValid: getIsValid(parent),
      message: parserNode.getStringValue("message"),
    );
    return validation;
  }

  LazyExpressionElementValue<bool> getIsValid(FormElement parent) {
    return LazyExpressionElementValue(
      () => CustomFunctionExpression<bool>(
        [
          DelegateExpression(
            [parent.id],
            parent.getExpressionProvider(),
          ),
        ],
        (parameters) {
          var text = parameters[0] as String;
          return text.length > 0;
        },
      ),
    );
  }
}
