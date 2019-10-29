import 'package:dynamic_forms/dynamic_forms.dart';

import 'date.dart';

class DateParser extends ElementParser<Date> {
  @override
  String get name => "date";

  @override
  Date parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var date = Date();
    date.fillDate(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getValue(
          "value", (date) => DateTime.parse(date), () => null,
          isImmutable: false),
      format: parserNode.getStringValue("format", isImmutable: true),
      initialDate: parserNode.getValue(
        "initialDate",
        (date) => DateTime.parse(date),
        () => DateTime.now(),
        isImmutable: true,
      ),
      firstDate: parserNode.getValue(
        "firstDate",
        (date) => DateTime.parse(date),
        isImmutable: true,
      ),
      lastDate: parserNode.getValue(
        "lastDate",
        (date) => DateTime.parse(date),
        isImmutable: true,
      ),
      label: parserNode.getStringValue("label"),
    );
    return date;
  }
}
