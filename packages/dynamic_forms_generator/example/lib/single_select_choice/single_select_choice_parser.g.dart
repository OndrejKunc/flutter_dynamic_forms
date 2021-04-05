// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class SingleSelectChoiceParser<TSingleSelectChoice extends SingleSelectChoice>
    extends FormElementParser<TSingleSelectChoice> {
  @override
  String get name => 'singleSelectChoice';

  @override
  FormElement getInstance() => SingleSelectChoice();

  @override
  void fillProperties(
    TSingleSelectChoice singleSelectChoice, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(singleSelectChoice, parserNode, parent, parser);
    singleSelectChoice
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..valueProperty = parserNode.getStringProperty(
        'value',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      );
  }
}
