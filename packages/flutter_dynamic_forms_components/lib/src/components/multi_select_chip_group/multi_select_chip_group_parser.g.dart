// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

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
        isContentProperty: true),
    );
    return multiSelectChipGroup;
  }
}
