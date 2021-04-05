import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class LazyExpressionProperty<T> extends ExpressionProperty<T> {
  Expression<T>? _expression;
  final LazyExpression<T> _lazyExpression;
  LazyExpressionProperty(this._lazyExpression);

  @override
  Expression<T> getExpression() {
    _expression ??= _lazyExpression();
    return _expression!;
  }
}

typedef LazyExpression<T> = Expression<T> Function();
