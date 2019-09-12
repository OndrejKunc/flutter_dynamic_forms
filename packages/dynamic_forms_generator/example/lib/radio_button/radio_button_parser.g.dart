// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonParser extends FormElementParser<RadioButton> {
  @override
  String get name => "radioButton";

  @override
  RadioButton parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var radioButton = RadioButton();
    radioButton.fillRadioButton(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
    );
    return radioButton;
  }
}
