import 'dart:convert';

import 'package:dynamic_forms/dynamic_forms.dart';

class JsonFormParserService extends FormParserService {
  JsonFormParserService(List<ElementParser> parsers) : super(parsers);

  @override
  ParserNode getRoot(String formString) {
    Map<String, dynamic> root = json.decode(formString);
    return JsonParserNode(root);
  }
}
