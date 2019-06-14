import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class ExplicitExpressionElementValue<T> extends ExpressionElementValue<T> {
  Expression<T> _expression;

  ExplicitExpressionElementValue(Expression<T> expression) {
    _expression = expression;
  }

  @override
  Expression<T> getExpression() => _expression;
}
