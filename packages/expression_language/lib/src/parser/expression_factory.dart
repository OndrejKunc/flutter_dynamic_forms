import 'package:expression_language/expression_language.dart';

Expression createDelegateExpression(
    List<String> expressionPath, ExpressionProvider? property) {
  if (property is ExpressionProvider<Integer>) {
    return DelegateExpression<Integer>(expressionPath, property);
  }
  if (property is ExpressionProvider<Integer?>) {
    return DelegateExpression<Integer?>(expressionPath, property);
  }
  if (property is ExpressionProvider<int>) {
    return IntToIntegerExpression(
      DelegateExpression<int>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<int?>) {
    return NullableIntToIntegerExpression(
      DelegateExpression<int?>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<bool>) {
    return DelegateExpression<bool>(expressionPath, property);
  }
  if (property is ExpressionProvider<bool?>) {
    return DelegateExpression<bool?>(expressionPath, property);
  }
  if (property is ExpressionProvider<String>) {
    return DelegateExpression<String>(expressionPath, property);
  }
  if (property is ExpressionProvider<String?>) {
    return DelegateExpression<String?>(expressionPath, property);
  }
  if (property is ExpressionProvider<DateTime>) {
    return DelegateExpression<DateTime>(expressionPath, property);
  }
  if (property is ExpressionProvider<DateTime?>) {
    return DelegateExpression<DateTime?>(expressionPath, property);
  }
  if (property is ExpressionProvider<Duration>) {
    return DelegateExpression<Duration>(expressionPath, property);
  }
  if (property is ExpressionProvider<Duration?>) {
    return DelegateExpression<Duration?>(expressionPath, property);
  }
  if (property is ExpressionProvider<Decimal>) {
    return DelegateExpression<Decimal>(expressionPath, property);
  }
  if (property is ExpressionProvider<Decimal?>) {
    return DelegateExpression<Decimal?>(expressionPath, property);
  }
  if (property is ExpressionProvider<double>) {
    return DoubleToDecimalExpression(
      DelegateExpression<double>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<double?>) {
    return NullableDoubleToDecimalExpression(
      DelegateExpression<double?>(expressionPath, property),
    );
  }
  if (property is ExpressionProvider<ExpressionProviderElement>) {
    return DelegateExpression<ExpressionProviderElement>(
        expressionPath, property);
  }
  if (property is ExpressionProvider<ExpressionProviderElement?>) {
    return DelegateExpression<ExpressionProviderElement?>(
        expressionPath, property);
  }
  if (property is ExpressionProvider<List<ExpressionProviderElement>>) {
    return DelegateExpression<List<ExpressionProviderElement>>(
        expressionPath, property);
  }
  if (property is ExpressionProvider<List<ExpressionProviderElement>?>) {
    return DelegateExpression<List<ExpressionProviderElement>?>(
        expressionPath, property);
  }
  throw UnknownExpressionFactoryException('Unknown expression factory');
}

ConditionalExpression createConditionalExpression(
    Expression<bool> condition, Expression trueValue, Expression falseValue) {
  if (trueValue is Expression<Integer>) {
    return ConditionalExpression<Integer>(
        condition, trueValue, falseValue as Expression<Integer>);
  }
  if (trueValue is Expression<bool>) {
    return ConditionalExpression<bool>(
        condition, trueValue, falseValue as Expression<bool>);
  }
  if (trueValue is Expression<String>) {
    return ConditionalExpression<String>(
        condition, trueValue, falseValue as Expression<String>);
  }
  if (trueValue is Expression<Decimal>) {
    return ConditionalExpression<Decimal>(
        condition, trueValue, falseValue as Expression<Decimal>);
  }
  if (trueValue is Expression<DateTime>) {
    return ConditionalExpression<DateTime>(
        condition, trueValue, falseValue as Expression<DateTime>);
  }
  if (trueValue is Expression<Duration>) {
    return ConditionalExpression<Duration>(
        condition, trueValue, falseValue as Expression<Duration>);
  }
  if (trueValue is Expression<ExpressionProviderElement>) {
    return ConditionalExpression<ExpressionProviderElement>(condition,
        trueValue, falseValue as Expression<ExpressionProviderElement>);
  }
  if (trueValue is Expression<List<ExpressionProviderElement>>) {
    return ConditionalExpression<List<ExpressionProviderElement>>(condition,
        trueValue, falseValue as Expression<List<ExpressionProviderElement>>);
  }
  throw UnknownExpressionTypeException(
      'Unknown expression in conditional expression');
}

NullableToNonNullableExpression createNonNullableConversionExpression(
    Expression value) {
  if (value is Expression<Integer>) {
    return NullableToNonNullableExpression<Integer>(value);
  }
  if (value is Expression<Integer?>) {
    return NullableToNonNullableExpression<Integer>(value);
  }
  if (value is Expression<bool>) {
    return NullableToNonNullableExpression<bool>(value);
  }
  if (value is Expression<bool?>) {
    return NullableToNonNullableExpression<bool>(value);
  }
  if (value is Expression<String>) {
    return NullableToNonNullableExpression<String>(value);
  }
  if (value is Expression<String?>) {
    return NullableToNonNullableExpression<String>(value);
  }
  if (value is Expression<Decimal>) {
    return NullableToNonNullableExpression<Decimal>(value);
  }
  if (value is Expression<Decimal?>) {
    return NullableToNonNullableExpression<Decimal>(value);
  }
  if (value is Expression<DateTime>) {
    return NullableToNonNullableExpression<DateTime>(value);
  }
  if (value is Expression<DateTime?>) {
    return NullableToNonNullableExpression<DateTime>(value);
  }
  if (value is Expression<Duration>) {
    return NullableToNonNullableExpression<Duration>(value);
  }
  if (value is Expression<Duration?>) {
    return NullableToNonNullableExpression<Duration>(value);
  }
  if (value is Expression<ExpressionProviderElement>) {
    return NullableToNonNullableExpression<ExpressionProviderElement>(value);
  }
  if (value is Expression<ExpressionProviderElement?>) {
    return NullableToNonNullableExpression<ExpressionProviderElement>(value);
  }
  if (value is Expression<List<ExpressionProviderElement>?>) {
    return NullableToNonNullableExpression<List<ExpressionProviderElement>>(
        value);
  }
  if (value is Expression<List<ExpressionProviderElement>?>) {
    return NullableToNonNullableExpression<List<ExpressionProviderElement>>(
        value);
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
  return functionExpressionMap[functionName]!(parameters);
}
