// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:dynamic_forms/dynamic_forms.dart';

import 'date.g.dart';

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
      dateValue: parserNode.getStringValue("dateValue", isImmutable: false),
      format: parserNode.getStringValue("format", isImmutable: true),
      firstDate: parserNode.getIntValue("firstDate", isImmutable: true),
      lastDate: parserNode.getIntValue("lastDate", isImmutable: true),
      label: parserNode.getStringValue("label"),
    );
    return date;
  }
}
