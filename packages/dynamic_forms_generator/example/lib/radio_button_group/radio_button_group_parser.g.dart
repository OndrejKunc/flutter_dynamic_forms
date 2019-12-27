// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonGroupParser extends ElementParser<RadioButtonGroup> {
  @override
  String get name => "radioButtonGroup";

  @override
  RadioButtonGroup parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var radioButtonGroup = RadioButtonGroup();
    radioButtonGroup
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..choicesProperty = parserNode.getChildren<RadioButton>(
          parent: radioButtonGroup,
          parser: parser,
          childrenPropertyName: "choices",
          isContentProperty: false)
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: false,
      )
      ..arrangementProperty = parserNode.getStringValue(
        "arrangement",
        isImmutable: false,
      );
    return radioButtonGroup;
  }
}
