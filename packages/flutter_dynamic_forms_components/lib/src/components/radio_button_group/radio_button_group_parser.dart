import 'package:dynamic_forms/dynamic_forms.dart';

import 'radio_button_group.dart';
import '../radio_button/radio_button.dart';

class RadioButtonGroupParser extends FormElementParser<RadioButtonGroup> {
  @override
  String get name => "radioButtonGroup";

  @override
  RadioButtonGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var radioButtonGroup = RadioButtonGroup();
    radioButtonGroup.fillRadioButtonGroup(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getStringValue("value", isImmutable: false),
      radioButtons: parserNode.getChildren<RadioButton>(
          parent: radioButtonGroup,
          parser: parser,
          childrenPropertyName: "radioButtons",
          isContentProperty: true),
      arrangement: parserNode.getValue<String>(
          "arrangement", ParserNode.convertToString, () => "vertical"),
    );
    return radioButtonGroup;
  }
}
