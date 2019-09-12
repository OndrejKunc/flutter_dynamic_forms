// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class CheckBoxParser extends FormElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var checkBox = CheckBox();
    checkBox.fillCheckBox(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      value: parserNode.getValue(
        "value",
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: true,
      ),
    );
    return checkBox;
  }
}
