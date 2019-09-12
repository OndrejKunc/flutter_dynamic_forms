// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class MultiSelectChoiceParser extends FormElementParser<MultiSelectChoice> {
  @override
  String get name => "multiSelectChoice";

  @override
  MultiSelectChoice parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var multiSelectChoice = MultiSelectChoice();
    multiSelectChoice.fillMultiSelectChoice(
    );
    return multiSelectChoice;
  }
}
