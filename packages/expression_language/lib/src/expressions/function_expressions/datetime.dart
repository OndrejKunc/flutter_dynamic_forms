import 'package:expression_language/expression_language.dart';

class DateTimeFunctionExpression extends Expression<DateTime> {
  final Expression<String> value;

  DateTimeFunctionExpression(this.value);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDateTimeFunction(this);
  }

  @override
  DateTime evaluate() {
    DateTime returnValue = DateTime.tryParse(value.evaluate());
    if (returnValue == null) {
      throw InvalidParameterException("Invalid format of date-time string");
    }
    return returnValue;
  }
}