import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/elements/element.dart';
import 'package:dynamic_forms/src/elements/form_element.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';

typedef ElementParserFunction = Element Function(
    ParserNode dataNode, FormElement parent);

abstract class FormParserService {
  final List<ElementParser> _parsers;
  Map<String, ElementParser> _parsersMap;

  FormParserService(this._parsers) {
    _parsersMap =
        Map.fromIterable(_parsers, key: (p) => p.name, value: (p) => p);
  }

  Element parse(String formString) {
    var root = getRoot(formString);
    return parseElement(root, null);
  }

  ParserNode getRoot(String formString);

  Element parseElement(ParserNode element, FormElement parent) {
    var elementName = element.getName();
    var parser = _parsersMap[elementName];
    if (parser == null) {
      throw Exception("No parser for element name $elementName found");
    }
    return parser.parse(element, parent, parseElement);
  }
}
