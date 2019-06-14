import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class LazyExpressionElementValue<T> extends ExpressionElementValue<T> {
  Expression<T> _expression;
  LazyExpression<T> _lazyExpression;
  LazyExpressionElementValue(this._lazyExpression);

  @override
  Expression<T> getExpression() {
    if (_expression == null) {
      _expression = _lazyExpression();
    }
    return _expression;
  }
}

typedef LazyExpression<T> = Expression<T> Function();
