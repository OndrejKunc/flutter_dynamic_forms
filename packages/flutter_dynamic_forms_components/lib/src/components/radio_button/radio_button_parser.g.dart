// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class RadioButtonParser extends ElementParser<RadioButton> {
  @override
  String get name => "radioButton";

  @override
  RadioButton parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
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
