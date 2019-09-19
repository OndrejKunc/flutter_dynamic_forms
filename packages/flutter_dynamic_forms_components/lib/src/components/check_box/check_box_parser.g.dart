// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class CheckBoxParser extends ElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
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
        isImmutable: false,
      ),
    );
    return checkBox;
  }
}
