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

class UnknownFunctionException extends ExpressionParserException {
  UnknownFunctionException(String message) : super(message);
}

class UnknownConstantTypeException extends ExpressionParserException {
  UnknownConstantTypeException(String message) : super(message);
}

class UnknownExpressionFactoryException extends ExpressionParserException {
  UnknownExpressionFactoryException(String message) : super(message);
}

class InvalidParameterException extends ExpressionParserException {
  InvalidParameterException(String message) : super(message);
}

class InvalidParameterCount extends ExpressionParserException {
  InvalidParameterCount(String message) : super(message);
}

class InvalidRegularExpressionException extends ExpressionParserException {
  InvalidRegularExpressionException(String message) : super(message);
}
