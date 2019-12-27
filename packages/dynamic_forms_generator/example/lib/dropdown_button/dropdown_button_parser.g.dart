// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownButtonParser extends ElementParser<DropdownButton> {
  @override
  String get name => "dropdownButton";

  @override
  DropdownButton parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var dropdownButton = DropdownButton();
    dropdownButton
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..choicesProperty = parserNode.getChildren<DropdownOption>(
          parent: dropdownButton,
          parser: parser,
          childrenPropertyName: "choices",
          isContentProperty: false)
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: false,
      );
    return dropdownButton;
  }
}
