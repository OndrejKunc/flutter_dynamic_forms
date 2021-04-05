import 'package:expression_language/expression_language.dart';

class DelegateExpression<T> extends Expression<T> {
  final ExpressionProvider<T> expressionProvider;
  final List<String> expressionPath;

  DelegateExpression(this.expressionPath, this.expressionProvider);

  @override
  T evaluate() {
    return expressionProvider.getExpression().evaluate();
  }

  ExpressionProvider<T> getExpressionProvider() {
    return expressionProvider;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      expressionProvider.getExpression(),
    ];
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    // Need to extract last expression provider from the original path
    var expressionProviderElement = elementMap[expressionPath[0]]!;
    late ExpressionProvider expressionProvider;

    var isLastItemElement = true;
    for (var i = 1; i < expressionPath.length; i++) {
      isLastItemElement = false;
      var propertyName = expressionPath[i];
      expressionProvider =
          expressionProviderElement.getExpressionProvider(propertyName);
      if (expressionProvider is ExpressionProvider<ExpressionProviderElement>) {
        expressionProviderElement =
            expressionProvider.getExpression().evaluate();
        isLastItemElement = true;
      }
    }
    if (isLastItemElement) {
      expressionProvider = expressionProviderElement.getExpressionProvider();
    }
    return DelegateExpression<T>(
        expressionPath, expressionProvider as ExpressionProvider<T>);
  }
}
