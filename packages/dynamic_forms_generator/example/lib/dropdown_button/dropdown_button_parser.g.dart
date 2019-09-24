// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownButtonParser extends ElementParser<DropdownButton> {
  @override
  String get name => "dropdownButton";

  @override
  DropdownButton parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var dropdownButton = DropdownButton();
    dropdownButton.fillDropdownButton(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<DropdownOption>(
          parent: dropdownButton,
          parser: parser,
          childrenPropertyName: "choices",
          isContentProperty: false),
      value: parserNode.getStringValue(
        "value",
        isImmutable: false,
      ),
    );
    return dropdownButton;
  }
}
