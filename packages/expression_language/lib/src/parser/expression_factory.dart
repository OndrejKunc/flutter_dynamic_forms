import 'package:expression_language/expression_language.dart';

Expression createDelegateExpression(
    List<String> expressionPath, ExpressionProvider property) {
  if (property is ExpressionProvider<Integer>) {
    return DelegateExpression<Integer>(expressionPath, property);
  }
  if (property is ExpressionProvider<int>) {
    return IntToIntegerExpression(
      DelegateExpression<int>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<bool>) {
    return DelegateExpression<bool>(expressionPath, property);
  }
  if (property is ExpressionProvider<String>) {
    return DelegateExpression<String>(expressionPath, property);
  }
  if (property is ExpressionProvider<DateTime>) {
    return DelegateExpression<DateTime>(expressionPath, property);
  }
  if (property is ExpressionProvider<Decimal>) {
    return DelegateExpression<Decimal>(expressionPath, property);
  }
  if (property is ExpressionProvider<double>) {
    return DoubleToDecimalExpression(
      DelegateExpression<double>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<ExpressionProviderElement>) {
    return DelegateExpression<ExpressionProviderElement>(
        expressionPath, property);
  }
  if (property is ExpressionProvider<List<ExpressionProviderElement>>) {
    return DelegateExpression<List<ExpressionProviderElement>>(
        expressionPath, property);
  }
  throw UnknownExpressionFactoryException('Unknown expression factory');
}

ConditionalExpression createConditionalExpression(
    Expression<bool> condition, Expression trueValue, Expression falseValue) {
  if (trueValue is Expression<Integer>) {
    return ConditionalExpression<Integer>(condition, trueValue, falseValue);
  }
  if (trueValue is Expression<bool>) {
    return ConditionalExpression<bool>(condition, trueValue, falseValue);
  }
  if (trueValue is Expression<String>) {
    return ConditionalExpression<String>(condition, trueValue, falseValue);
  }
  if (trueValue is Expression<Decimal>) {
    return ConditionalExpression<Decimal>(condition, trueValue, falseValue);
  }
  throw UnknownExpressionTypeException(
      'Unknown expression in conditional expression');
}

Expression createFunctionExpression(
    String functionName,
    List<Expression> parameters,
    Map<String, FunctionExpressionFactoryMethod> functionExpressionMap) {
  if (!functionExpressionMap.containsKey(functionName)) {
    throw UnknownFunctionException('Unknown function name $functionName');
  }
  return functionExpressionMap[functionName](parameters);
}
