import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';

class ValidationParser extends FormElementParser<Validation> {
  @override
  String get name => "validation";

  @override
  Validation parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
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
