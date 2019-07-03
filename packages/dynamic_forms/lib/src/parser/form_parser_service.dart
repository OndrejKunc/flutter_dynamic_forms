import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_elements.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/visitors/remove_blank_elements_visitor.dart';
import 'package:dynamic_forms/src/parser/visitors/trim_elements_visitor.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';

class FormParserService {
  final List<FormElementParser> _parsers;
  Map<String, FormElementParser> _parsersMap;

  FormParserService(this._parsers) {
    _parsersMap =
        Map.fromIterable(_parsers, key: (p) => p.name, value: (p) => p);
  }

  FormElement parse(String formString) {
    var document = xml.parse(formString);
    document.accept(RemoveBlankElementsVisitor());
    document.accept(TrimElementsVisitor());
    return parseFormElement(document.rootElement, null);
  }

  FormElement parseFormElement(XmlElement element, FormElement parent) {
    var elementName = element.name.qualified;
    var parser = _parsersMap[elementName];
    if (parser == null) {
      throw Exception("No parser for element name $elementName found");
    }
    return parser.parse(element, parent, parseFormElement);
  }
}
