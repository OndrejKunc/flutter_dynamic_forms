// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class RadioButtonGroupParser<TRadioButtonGroup extends RadioButtonGroup>
    extends SingleSelectGroupParser<TRadioButtonGroup, RadioButton> {
  @override
  String get name => 'radioButtonGroup';

  @override
  FormElement getInstance() => RadioButtonGroup();

  @override
  void fillProperties(
    TRadioButtonGroup radioButtonGroup, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(radioButtonGroup, parserNode, parent, parser);
    radioButtonGroup
      ..arrangementProperty = parserNode.getStringProperty(
        'arrangement',
        defaultValue: ParserNode.defaultString,
        isImmutable: false,
      );
  }
}
