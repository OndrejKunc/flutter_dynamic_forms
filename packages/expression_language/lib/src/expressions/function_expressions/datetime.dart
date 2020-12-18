import 'package:expression_language/expression_language.dart';

class DateTimeFunctionExpression extends Expression<DateTime> {
  final Expression<String> value;

  DateTimeFunctionExpression(this.value);

  @override
  DateTime evaluate() {
    var returnValue = DateTime.tryParse(value.evaluate());
    if (returnValue == null) {
      throw InvalidParameterException('Invalid format of date-time string');
    }
    return returnValue;
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
    ];
  }

  @override
  Expression<DateTime> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return DateTimeFunctionExpression(value.clone(elementMap));
  }
}
