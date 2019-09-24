import 'package:dynamic_forms/dynamic_forms.dart';

class ValidationParser extends ElementParser<Validation> {
  @override
  String get name => "validation";

  @override
  Validation parse(ParserNode parserNode, Element parent,
      ElementParserFunction parser) {
    Validation validation = Validation();
    validation.fillValidation(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      message: parserNode.getStringValue("message"),
      isValid: parserNode.getValue(
          "isValid", ParserNode.convertToBool, ParserNode.defaultTrue),
    );
    return validation;
  }
}
