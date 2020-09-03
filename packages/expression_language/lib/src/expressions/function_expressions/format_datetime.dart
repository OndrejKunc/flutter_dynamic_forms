import 'package:expression_language/expression_language.dart';
import 'package:intl/intl.dart';

class FormatDateTimeFunctionExpression extends Expression<String> {
  final Expression<DateTime> value;
  final Expression<String> pattern;

  FormatDateTimeFunctionExpression(this.value, this.pattern);

  @override
  String evaluate() {
    return DateFormat(pattern.evaluate()).format(value.evaluate());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitFormatDateTimeFunction(this);
  }
}
