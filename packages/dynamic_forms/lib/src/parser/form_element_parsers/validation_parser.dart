import 'package:dynamic_forms/dynamic_forms.dart';

class ValidationParser extends ElementParser<Validation> {
  @override
  String get name => "validation";

  @override
  Validation parse(
      ParserNode parserNode, Element parent, ElementParserFunction parser) {
    Validation validation = Validation();
    validation
      ..id = parserNode.getPlainStringValue("id")
      ..isVisibleProperty = parserNode.getIsVisible()
      ..parentProperty = parserNode.getParentValue(parent)
      ..messageProperty = parserNode.getStringValue("message")
      ..isValidProperty = parserNode.getValue(
          "isValid", ParserNode.convertToBool, ParserNode.defaultTrue);

    return validation;
  }
}
