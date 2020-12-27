import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

abstract class FunctionExpressionFactory<T> {
  String get functionName;
  Expression<T> createExpression(List<Expression<dynamic>> parameters);

  @protected
  void checkParameterLength(
      List<Expression<dynamic>> parameters, int expectedLength) {
    if (parameters.length != expectedLength) {
      throw InvalidParameterCount(
          'Function $functionName expects $expectedLength ${expectedLength == 1 ? 'parameter' : 'parameters'}');
    }
  }
}

class ExplicitFunctionExpressionFactory<T>
    extends FunctionExpressionFactory<T> {
  final String name;
  final FunctionExpressionFactoryMethod<T> createFunctionExpression;
  final int parametersLength;
  final bool checkParametersLength;

  ExplicitFunctionExpressionFactory({
    @required this.name,
    @required this.createFunctionExpression,
    this.parametersLength,
    this.checkParametersLength = true,
  }) : assert(parametersLength != null || !checkParametersLength);

  @override
  Expression<T> createExpression(List<Expression> parameters) {
    if (checkParametersLength) {
      checkParameterLength(parameters, parametersLength);
    }
    return createFunctionExpression(parameters);
  }

  @override
  String get functionName => name;
}

typedef FunctionExpressionFactoryMethod<T> = Expression<T> Function(
    List<Expression<dynamic>> parameters);
