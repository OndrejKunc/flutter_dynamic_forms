// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class TextParser extends ElementParser<Text> {
  @override
  String get name => "text";

  @override
  Text parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var text = Text();
    text
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..textInputTypeProperty = parserNode.getStringValue(
        "textInputType",
        isImmutable: true,
      )
      ..validationsProperty = parserNode.getChildren<Validation>(
          parent: text,
          parser: parser,
          childrenPropertyName: "validations",
          isContentProperty: false)
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: false,
      );
    return text;
  }
}
