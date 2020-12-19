import 'package:expression_language/expression_language.dart';

class RoundFunctionExpressionFactory extends FunctionExpressionFactory {
  @override
  Expression createExpression(List<Expression> parameters) {
    if (parameters.length == 3) {
      if (parameters[2] is Expression<Integer>) {
        return RoundFunctionIntRoundingModeExpression(
            parameters[0], parameters[1], parameters[2]);
      } else if (parameters[2] is Expression<String>) {
        return RoundFunctionStringRoundingModeExpression(
            parameters[0], parameters[1], parameters[2]);
      } else {
        throw InvalidParameterException(
            'Function $functionName expects integer or string as third parameter');
      }
    } else if (parameters.length == 2) {
      return RoundFunctionExpression(parameters[0], parameters[1]);
    } else {
      throw InvalidParameterCount(
          'Function $functionName expects 2 or 3 parameters');
    }
  }

  @override
  String get functionName => 'round';
}
