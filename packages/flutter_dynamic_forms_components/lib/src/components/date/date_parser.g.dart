// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DateParser<TDate extends Date>
    extends FormElementParser<TDate> {
  @override
  String get name => 'date';

  @override
  FormElement getInstance() => Date();

  @override
  void fillProperties(
    TDate date, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(date, parserNode, parent, parser);
    date
      ..firstDateProperty = parserNode.getDateTimeProperty(
        'firstDate',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..formatProperty = parserNode.getStringProperty(
        'format',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..initialDateProperty = parserNode.getDateTimeProperty(
        'initialDate',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..lastDateProperty = parserNode.getDateTimeProperty(
        'lastDate',
        defaultValue: () => null,
        isImmutable: true,
      )
      ..valueProperty = parserNode.getDateTimeProperty(
        'value',
        defaultValue: () => null,
        isImmutable: false,
      );
  }
}
