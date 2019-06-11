abstract class ExpressionParserException implements Exception {
  final String message;
  ExpressionParserException(this.message);
  String getMessage() => message;
}

class InvalidSyntaxException extends ExpressionParserException {
  InvalidSyntaxException(String message) : super(message);
}

class DivideByZeroException extends ExpressionParserException {
  DivideByZeroException(String message) : super(message);
}

class NullReferenceException extends ExpressionParserException {
  NullReferenceException(String message) : super(message);
}

class UnknownExpressionTypeException extends ExpressionParserException {
  UnknownExpressionTypeException(String message) : super(message);
}

class UnknownFunction extends ExpressionParserException {
  UnknownFunction(String message) : super(message);
}

class UnknownConstantType extends ExpressionParserException {
  UnknownConstantType(String message) : super(message);
}

class UnknownExpressionFactory extends ExpressionParserException {
  UnknownExpressionFactory(String message) : super(message);
}


class InvalidParameterCount extends ExpressionParserException {
  InvalidParameterCount(String message) : super(message);
}
