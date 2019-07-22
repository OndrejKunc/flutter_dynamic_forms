import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

abstract class FormElementParser<T> {
  String get name;
  T parse(
      XmlElement element, FormElement parent, FormElementParserFunction parser);
}
