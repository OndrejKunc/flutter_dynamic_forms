import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/elements/element.dart';
import 'package:dynamic_forms/src/elements/form_element.dart';

typedef ElementParserFunction = Element Function(
    ParserNode dataNode, FormElement? parent);

abstract class FormParserService {
  final List<ElementParser> _parsers;
  late Map<String, ElementParser> _parsersMap;

  FormParserService(this._parsers) {
    _parsersMap = {for (var p in _parsers) p.name: p};
  }

  Element parse(String formString) {
    var root = getRoot(formString);
    return parseElement(root, null);
  }

  ParserNode getRoot(String formString);

  Element parseElement(ParserNode element, FormElement? parent) {
    var elementName = element.getName();
    if (elementName == null) {
      throw MissingElementNameException(
          'An element is missing its name so it cannot be parsed.');
    }
    var parser = _parsersMap[elementName];
    if (parser == null) {
      throw MissingParserException(elementName);
    }
    return parser.parse(element, parent, parseElement);
  }
}
