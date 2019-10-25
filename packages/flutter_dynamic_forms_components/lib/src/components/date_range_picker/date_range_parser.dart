import 'package:dynamic_forms/dynamic_forms.dart';

import 'date_range.dart';

class DateRangeParser extends ElementParser<DateRange> {
  @override
  String get name => "dateRange";

  @override
  DateRange parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var date = DateRange();
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
        () => DateTime(1969, 01, 01),
        isImmutable: true,
      ),
      lastDate: parserNode.getValue(
        "lastDate",
        (date) => DateTime.parse(date),
        () => DateTime(2050, 01, 01),
        isImmutable: true,
      ),
      label: parserNode.getStringValue("label"),
    );
    return date;
  }
}
