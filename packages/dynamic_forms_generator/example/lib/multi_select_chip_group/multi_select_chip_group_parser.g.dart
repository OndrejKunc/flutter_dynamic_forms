// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class MultiSelectChipGroupParser extends FormElementParser<MultiSelectChipGroup> {
  @override
  String get name => "multiSelectChipGroup";

  @override
  MultiSelectChipGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var multiSelectChipGroup = MultiSelectChipGroup();
    multiSelectChipGroup.fillMultiSelectChipGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<MultiSelectChipChoice>(
        parent: multiSelectChipGroup,
        parser: parser,
        childrenPropertyName: "choices",
        isContentProperty: false),
    );
    return multiSelectChipGroup;
  }
}
