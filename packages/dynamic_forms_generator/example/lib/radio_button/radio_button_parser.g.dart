// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonParser<TRadioButton extends RadioButton>
    extends SingleSelectChoiceParser<TRadioButton> {
  @override
  String get name => 'radioButton';

  @override
  FormElement getInstance() => RadioButton();

  @override
  void fillProperties(
    TRadioButton radioButton, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(radioButton, parserNode, parent, parser);
  }
}
