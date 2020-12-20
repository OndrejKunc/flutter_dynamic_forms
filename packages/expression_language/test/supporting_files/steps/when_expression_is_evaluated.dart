import 'package:expression_language/expression_language.dart';
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
