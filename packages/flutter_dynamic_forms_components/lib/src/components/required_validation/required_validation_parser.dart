import 'package:dynamic_forms/dynamic_forms.dart';

import '../required_validation/required_validation.dart';

class RequiredValidationParser extends ElementParser<RequiredValidation> {
  @override
  String get name => "requiredValidation";

  @override
  RequiredValidation parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    RequiredValidation validation = RequiredValidation();
    validation.fillRequiredValidation(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      message: parserNode.getStringValue("message"),
    );
    return validation;
  }
}
