import 'package:expression_language/expression_language.dart';

class ConstantExpressionProvider<T> extends ExpressionProvider<T> {
  final T value;

  ConstantExpressionProvider(this.value);

  @override
  Expression<T> getExpression() {
    return ConstantExpression(value);
  }
}
