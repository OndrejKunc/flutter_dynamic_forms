// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChipChoiceParser extends FormElementParser<SingleSelectChipChoice> {
  @override
  String get name => "singleSelectChipChoice";

  @override
  SingleSelectChipChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
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
