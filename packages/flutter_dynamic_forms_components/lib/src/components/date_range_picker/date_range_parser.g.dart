// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
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
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(dateRange, parserNode, parent, parser);
    dateRange
      ..firstValueProperty = parserNode.getNullableDateTimeProperty(
        'firstValue',
        defaultValue: () => null,
        isImmutable: false,
      )
      ..formatProperty = parserNode.getStringProperty(
        'format',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..initialDateProperty = parserNode.getDateTimeProperty(
        'initialDate',
        defaultValue: ParserNode.defaultDateTime,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..maxDateProperty = parserNode.getDateTimeProperty(
        'maxDate',
        defaultValue: () => DateTime.parse('20500101'),
        isImmutable: true,
      )
      ..minDateProperty = parserNode.getDateTimeProperty(
        'minDate',
        defaultValue: () => DateTime.parse('19690101'),
        isImmutable: true,
      )
      ..secondValueProperty = parserNode.getNullableDateTimeProperty(
        'secondValue',
        defaultValue: () => null,
        isImmutable: false,
      );
  }
}
