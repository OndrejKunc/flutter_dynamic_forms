// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChoiceParser extends ElementParser<SingleSelectChoice> {
  @override
  String get name => "singleSelectChoice";

  @override
  SingleSelectChoice parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var singleSelectChoice = SingleSelectChoice();
    singleSelectChoice
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
    return singleSelectChoice;
  }
}
