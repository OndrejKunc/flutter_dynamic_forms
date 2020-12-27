import 'package:expression_language/expression_language.dart';

class MatchesFunctionExpression extends Expression<bool> {
  final Expression<String> value;
  final Expression<String> regex;

  MatchesFunctionExpression(this.value, this.regex);

  @override
  bool evaluate() {
    return _isFullMatch(value.evaluate(), regex.evaluate());
  }

  @override
  List<Expression<dynamic>> getChildren() {
    return [
      value,
      regex,
    ];
  }

  @override
  Expression<bool> clone(Map<String, ExpressionProviderElement> elementMap) {
    return MatchesFunctionExpression(
        value.clone(elementMap), regex.clone(elementMap));
  }

  bool _isFullMatch(String value, String regexSource) {
    try {
      final regex = RegExp(regexSource);
      final matches = regex.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw InvalidRegularExpressionException(
          'Regular expression $regexSource is invalid');
    }
  }
}
