// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class DropdownOptionParser extends ElementParser<DropdownOption> {
  @override
  String get name => "dropdownOption";

  @override
  DropdownOption parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var dropdownOption = DropdownOption();
    dropdownOption
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..valueProperty = parserNode.getStringValue(
        "value",
        isImmutable: true,
      );
    return dropdownOption;
  }
}
