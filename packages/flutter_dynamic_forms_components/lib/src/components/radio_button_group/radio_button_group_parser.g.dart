// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

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
          isContentProperty: true),
      value: parserNode.getStringValue(
        "value",
        isImmutable: false,
      ),
      arrangement: parserNode.getStringValue(
        "arrangement",
        isImmutable: false,
      ),
    );
    return radioButtonGroup;
  }
}
