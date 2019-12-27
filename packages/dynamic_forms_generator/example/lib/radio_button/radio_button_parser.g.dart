// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonParser extends ElementParser<RadioButton> {
  @override
  String get name => "radioButton";

  @override
  RadioButton parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var radioButton = RadioButton();
    radioButton
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: true,
      );
    return radioButton;
  }
}
