// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectChoiceParser extends ElementParser<MultiSelectChoice> {
  @override
  String get name => "multiSelectChoice";

  @override
  MultiSelectChoice parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var multiSelectChoice = MultiSelectChoice();
    multiSelectChoice.fillMultiSelectChoice(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      isSelected: parserNode.getValue(
        "isSelected",
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: false,
      ),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
    );
    return multiSelectChoice;
  }
}
