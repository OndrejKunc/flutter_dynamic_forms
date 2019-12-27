// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class CheckBoxParser extends ElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var checkBox = CheckBox();
    checkBox
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..myDateProperty = parserNode.getValue<DateTime>(
        "myDate",
        (s) => DateTime.parse(s),
        () => DateTime.parse("1969-07-20 20:18:04Z"),
        isImmutable: true,
      )
      ..myDecimalProperty = parserNode.getValue<Decimal>(
        "myDecimal",
        (s) => Decimal.parse(s),
        () => Decimal.fromDouble(42),
        isImmutable: true,
      )
      ..myDoubleProperty = parserNode.getValue<double>(
        "myDouble",
        (s) => double.parse(s),
        () => 27.0,
        isImmutable: true,
      )
      ..myIntProperty = parserNode.getValue<int>(
        "myInt",
        (s) => int.parse(s),
        () => 51,
        isImmutable: true,
      )
      ..textColorProperty = parserNode.getValue<String>(
        "textColor",
        (s) => s,
        () => "b74903",
        isImmutable: true,
      )
      ..valueProperty = parserNode.getValue(
        "value",
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: false,
      );
    return checkBox;
  }
}
