import 'package:dynamic_forms/dynamic_forms.dart';

abstract class FormElementParser<T> {
  String get name;
  T parse(ParserNode dataNode, FormElement parent,
      FormElementParserFunction parser);
}
