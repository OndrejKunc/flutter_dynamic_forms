import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class ExplicitExpressionProperty<T> extends ExpressionProperty<T> {
  final Expression<T> _expression;

  ExplicitExpressionProperty(Expression<T> expression)
      : _expression = expression;

  @override
  Expression<T> getExpression() => _expression;
}
