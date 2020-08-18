import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

abstract class ParsedFormManager extends FormManager {
  void init({
    @required String content,
    @required List<FormElementParser> parsers,
  }) {
    var formBuilder = FormBuilder(getFormParserService(parsers));
    var formData = formBuilder.build(content);
    fillFromFormData(formData);
  }

  FormParserService getFormParserService(List<FormElementParser> parsers);
}
