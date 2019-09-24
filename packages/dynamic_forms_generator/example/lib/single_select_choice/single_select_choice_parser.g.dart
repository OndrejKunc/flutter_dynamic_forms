// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChoiceParser extends ElementParser<SingleSelectChoice> {
  @override
  String get name => "singleSelectChoice";

  @override
  SingleSelectChoice parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var singleSelectChoice = SingleSelectChoice();
    singleSelectChoice.fillSingleSelectChoice(
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
    return singleSelectChoice;
  }
}
