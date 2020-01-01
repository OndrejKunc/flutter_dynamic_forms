// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DateParser<TDate extends Date>
    extends FormElementParser<TDate> {
  @override
  String get name => "date";

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
      ..firstDateProperty = parserNode.getValue<DateTime>(
        "firstDate",
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: true,
      )
      ..formatProperty = parserNode.getStringValue(
        "format",
        isImmutable: true,
      )
      ..initialDateProperty = parserNode.getValue<DateTime>(
        "initialDate",
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringValue(
        "label",
        isImmutable: true,
      )
      ..lastDateProperty = parserNode.getValue<DateTime>(
        "lastDate",
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: true,
      )
      ..valueProperty = parserNode.getValue<DateTime>(
        "value",
        (s) => DateTime.parse(s),
        () => null,
        isImmutable: false,
      );
  }
}
