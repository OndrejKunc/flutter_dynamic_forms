import 'package:dynamic_forms/dynamic_forms.dart';

import 'radio_button.dart';

class RadioButtonParser extends FormElementParser<RadioButton> {
  @override
  String get name => "radioButton";

  @override
  RadioButton parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var radioButton = RadioButton();
    radioButton.fillSingleSelectChoice(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value"),
      label: parserNode.getStringValue("label"),
    );
    return radioButton;
  }
}
