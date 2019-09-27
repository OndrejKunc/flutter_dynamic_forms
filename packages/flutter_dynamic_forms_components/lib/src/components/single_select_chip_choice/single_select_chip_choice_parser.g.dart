// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectChipChoiceParser extends ElementParser<SingleSelectChipChoice> {
  @override
  String get name => "singleSelectChipChoice";

  @override
  SingleSelectChipChoice parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var singleSelectChipChoice = SingleSelectChipChoice();
    singleSelectChipChoice.fillSingleSelectChipChoice(
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
    return singleSelectChipChoice;
  }
}
