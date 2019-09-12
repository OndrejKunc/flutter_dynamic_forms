// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChipGroupParser extends FormElementParser<SingleSelectChipGroup> {
  @override
  String get name => "singleSelectChipGroup";

  @override
  SingleSelectChipGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var singleSelectChipGroup = SingleSelectChipGroup();
    singleSelectChipGroup.fillSingleSelectChipGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<SingleSelectChipChoice>(
        parent: singleSelectChipGroup,
        parser: parser,
        childrenPropertyName: "choices",
        isContentProperty: false),
      value: parserNode.getStringValue(
        "value",
        isImmutable: true,
      ),
    );
    return singleSelectChipGroup;
  }
}
