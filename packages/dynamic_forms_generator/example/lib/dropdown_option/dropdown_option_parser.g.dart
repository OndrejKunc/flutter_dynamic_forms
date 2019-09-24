// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownOptionParser extends ElementParser<DropdownOption> {
  @override
  String get name => "dropdownOption";

  @override
  DropdownOption parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var dropdownOption = DropdownOption();
    dropdownOption.fillDropdownOption(
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
    return dropdownOption;
  }
}
