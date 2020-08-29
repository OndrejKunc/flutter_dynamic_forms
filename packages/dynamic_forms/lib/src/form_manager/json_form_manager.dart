import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/parsed_form_manager.dart';
import 'package:dynamic_forms/src/parser/form_parser_service.dart';

class JsonFormManager extends ParsedFormManager {
  @override
  FormParserService getFormParserService(
      List<FormElementParser<FormElement>> parsers) {
    return JsonFormParserService(parsers);
  }
}
