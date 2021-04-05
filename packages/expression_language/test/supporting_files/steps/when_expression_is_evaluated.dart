import 'package:expression_language/expression_language.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class WhenExpressionIsEvaluated
    extends When1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String expression) async {
    try {
      var result = world.parser.parse(expression);
      var expressionValue = result.value as Expression;
      var value = expressionValue.evaluate();
      world.result = value;
    } catch (exception) {
      world.result = exception;
    }
  }

  @override
  RegExp get pattern => RegExp(r'expression {string} is evaluated');
}
