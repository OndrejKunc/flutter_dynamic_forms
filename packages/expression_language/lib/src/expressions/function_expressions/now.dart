import 'package:expression_language/expression_language.dart';

class NowFunctionExpression extends Expression<DateTime> {
  @override
  DateTime evaluate() => DateTime.now();

  @override
  List<Expression<dynamic>> getChildren() {
    return [];
  }

  @override
  Expression<DateTime> clone(
      Map<String, ExpressionProviderElement> elementMap) {
    return NowFunctionExpression();
  }
}
