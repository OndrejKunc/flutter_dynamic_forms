// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DateRangeParser<TDateRange extends DateRange>
    extends FormElementParser<TDateRange> {
  @override
  String get name => 'dateRange';

  @override
  FormElement getInstance() => DateRange();

  @override
  void fillProperties(
    TDateRange dateRange, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(dateRange, parserNode, parent, parser);
    dateRange
      ..firstValueProperty = parserNode.getValue<DateTime>(
        'firstValue',
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: false,
      )
      ..formatProperty = parserNode.getStringValue(
        'format',
        isImmutable: true,
      )
      ..initialDateProperty = parserNode.getValue<DateTime>(
        'initialDate',
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..maxDateProperty = parserNode.getValue<DateTime>(
        'maxDate',
        (s) => DateTime.parse(s),
        () => DateTime.parse('20500101'),
        isImmutable: true,
      )
      ..minDateProperty = parserNode.getValue<DateTime>(
        'minDate',
        (s) => DateTime.parse(s),
        () => DateTime.parse('19690101'),
        isImmutable: true,
      )
      ..secondValueProperty = parserNode.getValue<DateTime>(
        'secondValue',
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: false,
      );
  }
}
