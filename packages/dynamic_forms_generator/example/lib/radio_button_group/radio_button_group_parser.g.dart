// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonGroupParser extends FormElementParser<RadioButtonGroup> {
  @override
  String get name => "radioButtonGroup";

  @override
  RadioButtonGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var radioButtonGroup = RadioButtonGroup();
    radioButtonGroup.fillRadioButtonGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<RadioButton>(
        parent: radioButtonGroup,
        parser: parser,
        childrenPropertyName: "choices",
        isContentProperty: false),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
      arrangement: parserNode.getStringValue(
        "arrangement",
        isImmutable: true,
      ),
    );
    return radioButtonGroup;
  }
}
