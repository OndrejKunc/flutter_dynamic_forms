// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class CheckBoxParser<TCheckBox extends CheckBox>
    extends FormElementParser<TCheckBox> {
  @override
  String get name => 'checkBox';

  @override
  FormElement getInstance() => CheckBox();

  @override
  void fillProperties(
    TCheckBox checkBox, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(checkBox, parserNode, parent, parser);
    checkBox
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..myDateProperty = parserNode.getDateTimeProperty(
        'myDate',
        defaultValue: () => DateTime.parse('1969-07-20 20:18:04Z'),
        isImmutable: true,
      )
      ..myDecimalProperty = parserNode.getDecimalProperty(
        'myDecimal',
        defaultValue: () => Decimal.fromDouble(42),
        isImmutable: true,
      )
      ..myDoubleProperty = parserNode.getDoubleProperty(
        'myDouble',
        defaultValue: () => 27.0,
        isImmutable: true,
      )
      ..myIntProperty = parserNode.getIntProperty(
        'myInt',      
        defaultValue: () => 51,
        isImmutable: true,
      )
      ..textColorProperty = parserNode.getStringProperty(
        'textColor',
        defaultValue: () => 'b74903',
        isImmutable: true,
      )
      ..valueProperty = parserNode.getBoolProperty(
        'value',        
        defaultValue: ParserNode.defaultFalse,
        isImmutable: false,
      );
  }
}
