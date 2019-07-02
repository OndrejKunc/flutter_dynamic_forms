import 'package:expression_language/expression_language.dart';

class DelegateExpression<T> extends Expression<T> {
  final ExpressionProvider<T> expressionProvider;
  final List<String> expressionPath;

  DelegateExpression(this.expressionPath, this.expressionProvider);

  @override
  T evaluate() {
    return expressionProvider.getExpression().evaluate();
  }

  ExpressionProvider<T> getExpressionProvider<T>() {
    return expressionProvider as ExpressionProvider<
        T>; //Doesn't work without as, probably compiler error
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDelegate(this);
  }
}