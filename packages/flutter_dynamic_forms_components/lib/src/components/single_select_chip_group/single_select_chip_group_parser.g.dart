// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectChipGroupParser extends ElementParser<SingleSelectChipGroup> {
  @override
  String get name => "singleSelectChipGroup";

  @override
  SingleSelectChipGroup parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var singleSelectChipGroup = SingleSelectChipGroup();
    singleSelectChipGroup.fillSingleSelectChipGroup(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      choices: parserNode.getChildren<SingleSelectChipChoice>(
          parent: singleSelectChipGroup,
          parser: parser,
          childrenPropertyName: "choices",
          isContentProperty: true),
      value: parserNode.getStringValue(
        "value",
        isImmutable: false,
      ),
    );
    return singleSelectChipGroup;
  }
}
