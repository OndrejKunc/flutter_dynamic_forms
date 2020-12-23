import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

abstract class ParsedFormManager extends FormManager {
  void init({
    @required String content,
    @required List<FormElementParser<FormElement>> parsers,
    List<FunctionExpressionFactory> expressionFactories = const [],
  }) {
    var formBuilder = FormBuilder(getFormParserService(parsers),
        expressionFactories: expressionFactories);
    var formData = formBuilder.build(content);
    fillFromFormData(formData);
  }

  FormParserService getFormParserService(
      List<FormElementParser<FormElement>> parsers);
}
