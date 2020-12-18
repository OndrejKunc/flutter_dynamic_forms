import 'package:expression_language/expression_language.dart';

class NowInUtcFunctionExpression extends Expression<DateTime> {
  @override
  DateTime evaluate() => DateTime.now().toUtc();

  @override
  List<Expression<dynamic>> getChildren() {
    return [];
  }

  @override
  Expression<DateTime> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return NowInUtcFunctionExpression();
  }
}
