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
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(checkBox, parserNode, parent, parser);
    checkBox
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: () => 'abc',
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
      ..nullableBoolProperty = parserNode.getNullableBoolProperty(
        'nullableBool',
        defaultValue: ParserNode.defaultFalse,
        isImmutable: false,
      )
      ..nullableDateProperty = parserNode.getNullableDateTimeProperty(
        'nullableDate',
        defaultValue: () => DateTime.parse('1969-07-20 20:18:04Z'),
        isImmutable: true,
      )
      ..nullableDecimalProperty = parserNode.getNullableDecimalProperty(
        'nullableDecimal',
        defaultValue: () => Decimal.fromDouble(42),
        isImmutable: true,
      )
      ..nullableDefaultBoolProperty = parserNode.getNullableBoolProperty(
        'nullableDefaultBool',
        defaultValue: () => null,
        isImmutable: false,
      )
      ..nullableDefaultDateProperty = parserNode.getNullableDateTimeProperty(
        'nullableDefaultDate',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDefaultDecimalProperty = parserNode.getNullableDecimalProperty(
        'nullableDefaultDecimal',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDefaultDoubleProperty = parserNode.getNullableDoubleProperty(
        'nullableDefaultDouble',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDefaultIntProperty = parserNode.getNullableIntProperty(
        'nullableDefaultInt',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDefaultLabelProperty = parserNode.getNullableStringProperty(
        'nullableDefaultLabel',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDefaultTextColorProperty = parserNode.getNullableStringProperty(
        'nullableDefaultTextColor',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..nullableDoubleProperty = parserNode.getNullableDoubleProperty(
        'nullableDouble',
        defaultValue: () => 27.0,
        isImmutable: true,
      )
      ..nullableIntProperty = parserNode.getNullableIntProperty(
        'nullableInt',
        defaultValue: () => 51,
        isImmutable: true,
      )
      ..nullableLabelProperty = parserNode.getNullableStringProperty(
        'nullableLabel',
        defaultValue: () => 'abc',
        isImmutable: true,
      )
      ..nullableTextColorProperty = parserNode.getNullableStringProperty(
        'nullableTextColor',
        defaultValue: () => 'b74903',
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
