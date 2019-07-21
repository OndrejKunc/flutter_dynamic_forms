import 'package:expression_language/expression_language.dart';

class DurationFunctionExpression extends Expression<Duration> {
  final Expression<String> value;

  DurationFunctionExpression(this.value);

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitDurationFunction(this);
  }

  @override
  Duration evaluate() {
    return convertIso8601DurationToDuration(value.evaluate());
  }

  Duration convertIso8601DurationToDuration(String input) {
    List<int> values = List(4);
    RegExp validator =
        RegExp(r"^P(([0-9]+D)?T?([0-9]+H)?([0-9]+M)?([0-9]+S)?)$");
    if (!validator.hasMatch(input)) {
      throw InvalidParameterException("Invalid format of duration string");
    }
    List<RegExp> regularExpressions = [
      RegExp(r"[0-9]+D"),
      RegExp(r"[0-9]+H"),
      RegExp(r"[0-9]+M"),
      RegExp(r"[0-9]+S")
    ];
    List<String> matchedStrings = [
      regularExpressions[0].stringMatch(input),
      regularExpressions[1].stringMatch(input),
      regularExpressions[2].stringMatch(input),
      regularExpressions[3].stringMatch(input)
    ];

    for (int i = 0; i < matchedStrings.length; i++) {
      if ((matchedStrings[i] != null) && (matchedStrings.isNotEmpty)) {
        values[i] = int.parse(
            matchedStrings[i].substring(0, matchedStrings[i].length - 1));
      } else {
        values[i] = 0;
      }
    }
    return Duration(
        days: values[0],
        hours: values[1],
        minutes: values[2],
        seconds: values[3]);
  }
}
