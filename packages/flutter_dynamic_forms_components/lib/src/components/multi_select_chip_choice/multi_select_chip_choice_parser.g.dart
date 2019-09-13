// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectChipChoiceParser extends FormElementParser<MultiSelectChipChoice> {
  @override
  String get name => "multiSelectChipChoice";

  @override
  MultiSelectChipChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var multiSelectChipChoice = MultiSelectChipChoice();
    multiSelectChipChoice.fillMultiSelectChipChoice(
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
    return multiSelectChipChoice;
  }
}
