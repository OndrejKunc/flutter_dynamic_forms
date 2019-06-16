import 'package:expression_language/src/expressions/expression_provider.dart';
import 'package:expression_language/src/expressions/expressions.dart';
import 'package:expression_language/src/number_type/decimal.dart';
import 'package:expression_language/src/number_type/integer.dart';
import 'package:expression_language/src/parser/expression_parser_exceptions.dart';

DelegateExpression createDelegateExpression(List<String> expressionPath, ExpressionProvider elementValue) {
  if (elementValue is ExpressionProvider<Integer>) {
    return DelegateExpression<Integer>(expressionPath, elementValue);
  }
  if (elementValue is ExpressionProvider<bool>) {
    return DelegateExpression<bool>(expressionPath, elementValue);
  }
  if (elementValue is ExpressionProvider<String>) {
    return DelegateExpression<String>(expressionPath, elementValue);
  }
  if (elementValue is ExpressionProvider<Decimal>) {
    return DelegateExpression<Decimal>(expressionPath, elementValue);
  }
  if (elementValue is ExpressionProvider<ExpressionProviderElement>) {
    return DelegateExpression<ExpressionProviderElement>(expressionPath, elementValue);
  }
  if (elementValue is ExpressionProvider<List<ExpressionProviderElement>>) {
    return DelegateExpression<List<ExpressionProviderElement>>(expressionPath, elementValue);
  }
  throw UnknownExpressionFactory("Unknown expression factory");
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
  throw UnknownExpressionTypeException("Unknown expression in conditional expression");
}

Expression createFunctionExpression(
    String functionName, List<Expression> parameters) {
  if (functionName == "length") {
    if (parameters.length != 1) {
      throw InvalidParameterCount("Function $functionName expect only 1 parameter");
    }
    return LengthFunctionExpression(parameters[0]);
  }
  if (functionName == "toString") {
    if (parameters.length != 1) {
      throw InvalidParameterCount("Function $functionName expect only 1 parameter");
    }
    return ToStringFunctionExpression(parameters[0]);
  }
  if (functionName == "count") {
    if (parameters.length != 1) {
      throw InvalidParameterCount("Function $functionName expect only 1 parameter");
    }
    return ListCountFunctionExpression(parameters[0]);
  }
  throw UnknownFunction("Unknown function name $functionName");
}
