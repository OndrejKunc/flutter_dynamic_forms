// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class TextParser extends FormElementParser<Text> {
  @override
  String get name => "text";

  @override
  Text parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var text = Text();
    text.fillText(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      textInputType: parserNode.getStringValue(
        "textInputType",
        isImmutable: true,
      ),
      validations: parserNode.getChildren<Validation>(
        parent: text,
        parser: parser,
        childrenPropertyName: "validations",
        isContentProperty: false),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
    );
    return text;
  }
}
