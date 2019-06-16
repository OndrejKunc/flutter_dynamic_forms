import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:petitparser/petitparser.dart';

class StringExpressionElementValue<T> extends ExpressionElementValue<T> {
  Expression<T> _expression;
  final String _expressionString;

  StringExpressionElementValue(this._expressionString);

  void buildExpression(Parser parser) {
    var result = parser.parse(_expressionString);
    _expression = result.value as Expression<T>;
  }

  @override
  Expression<T> getExpression() => _expression;
}
