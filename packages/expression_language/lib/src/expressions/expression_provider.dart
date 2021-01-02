import 'expressions.dart';

abstract class ExpressionProvider<T> {
  Expression<T> getExpression();
}

abstract class ExpressionProviderElement {
  String? get id;
  ExpressionProvider getExpressionProvider([String? propertyName]);
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent);
}
