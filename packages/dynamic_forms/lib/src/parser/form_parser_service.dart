import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';

typedef FormElementParserFunction = FormElement Function(
    ParserNode dataNode, FormElement parent);

abstract class FormParserService {
  final List<FormElementParser> _parsers;
  Map<String, FormElementParser> _parsersMap;

  FormParserService(this._parsers) {
    _parsersMap =
        Map.fromIterable(_parsers, key: (p) => p.name, value: (p) => p);
  }

  FormElement parse(String formString) {
    var root = getRoot(formString);
    return parseFormElement(root, null);
  }

  ParserNode getRoot(String formString);

  FormElement parseFormElement(ParserNode element, FormElement parent) {
    var elementName = element.getName();
    var parser = _parsersMap[elementName];
    if (parser == null) {
      throw Exception("No parser for element name $elementName found");
    }
    return parser.parse(element, parent, parseFormElement);
  }
}
