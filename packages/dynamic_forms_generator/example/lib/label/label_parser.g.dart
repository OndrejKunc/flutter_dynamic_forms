// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class LabelParser extends FormElementParser<Label> {
  @override
  String get name => "label";

  @override
  Label parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var label = Label();
    label.fillLabel(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
    );
    return label;
  }
}
