// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class CheckBoxParser extends ElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var checkBox = CheckBox();
    checkBox.fillCheckBox(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      myDate: parserNode.getValue<DateTime>(
        "myDate",
        (s) => DateTime.parse(s),
        () => DateTime.parse("1969-07-20 20:18:04Z"),
        isImmutable: true,
      ),
      myDecimal: parserNode.getValue<Decimal>(
        "myDecimal",
        (s) => Decimal.parse(s),
        () => Decimal.fromDouble(42),
        isImmutable: true,
      ),
      myDouble: parserNode.getValue<double>(
        "myDouble",
        (s) => double.parse(s),
        () => 27.0,
        isImmutable: true,
      ),
      myInt: parserNode.getValue<int>(
        "myInt",
        (s) => int.parse(s),
        () => 51,
        isImmutable: true,
      ),
      textColor: parserNode.getValue<String>(
        "textColor",
        (s) => s,
        () => "b74903",
        isImmutable: true,
      ),
      value: parserNode.getValue(
        "value",
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
        isImmutable: false,
      ),
    );
    return checkBox;
  }
}
