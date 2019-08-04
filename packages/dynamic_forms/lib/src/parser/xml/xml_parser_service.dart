import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/visitors/remove_blank_elements_visitor.dart';
import 'package:dynamic_forms/src/parser/visitors/trim_elements_visitor.dart';
import 'package:xml/xml.dart' as xml;

class XmlFormParserService extends FormParserService {
  XmlFormParserService(List<FormElementParser> parsers) : super(parsers);

  @override
  ParserNode getRoot(String formString) {
    var document = xml.parse(formString);
    document.accept(RemoveBlankElementsVisitor());
    document.accept(TrimElementsVisitor());
    var rootElement = document.rootElement;
    return XmlParserNode(rootElement);
  }
}
