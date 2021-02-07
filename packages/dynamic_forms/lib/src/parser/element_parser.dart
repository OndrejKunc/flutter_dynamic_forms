import 'package:dynamic_forms/dynamic_forms.dart';

abstract class ElementParser<T> {
  String get name;
  T parse(
      ParserNode dataNode, FormElement? parent, ElementParserFunction parser);
}
