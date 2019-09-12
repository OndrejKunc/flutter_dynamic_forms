// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChoiceParser extends FormElementParser<SingleSelectChoice> {
  @override
  String get name => "singleSelectChoice";

  @override
  SingleSelectChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var singleSelectChoice = SingleSelectChoice();
    singleSelectChoice.fillSingleSelectChoice(
    );
    return singleSelectChoice;
  }
}
