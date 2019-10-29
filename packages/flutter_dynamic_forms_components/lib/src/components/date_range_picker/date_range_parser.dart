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
      format: parserNode.getStringValue("format", isImmutable: true),
      firstValue: parserNode.getValue(
        "firstValue",
        (date) => DateTime.parse(date),
        () => null,
        isImmutable: false,
      ),
      secondValue: parserNode.getValue(
        "secondValue",
        (date) => DateTime.parse(date),
        () => null,
        isImmutable: false,
      ),
      initialDate: parserNode.getValue(
        "initialDate",
        (date) => DateTime.parse(date),
        () => DateTime.now(),
        isImmutable: true,
      ),
      minDate: parserNode.getValue(
        "minDate",
        (date) => DateTime.parse(date),
        () => DateTime(1969, 01, 01),
        isImmutable: true,
      ),
      maxDate: parserNode.getValue(
        "maxDate",
        (date) => DateTime.parse(date),
        () => DateTime(2050, 01, 01),
        isImmutable: true,
      ),
      label: parserNode.getStringValue("label"),
    );
    return date;
  }
}
