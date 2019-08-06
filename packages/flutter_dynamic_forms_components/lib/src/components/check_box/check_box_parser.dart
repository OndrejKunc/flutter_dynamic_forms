import 'package:dynamic_forms/dynamic_forms.dart';

import 'check_box.dart';

class CheckBoxParser extends FormElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var checkBox = CheckBox();
    checkBox.fillCheckBox(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getValue("isValid", ParserNode.convertToBool, ParserNode.defaultFalse,
          isImmutable: false),
      label: parserNode.getStringValue("label"),
    );
    return checkBox;
  }
}
