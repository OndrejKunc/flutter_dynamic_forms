import 'dart:convert';

import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';

class JsonFormParserService extends FormParserService {
  JsonFormParserService(List<ElementParser> parsers) : super(parsers);

  @override
  ParserNode getRoot(String formString) {
    Map<String, dynamic> root = json.decode(formString);
    return JsonParserNode(root);
  }
}
