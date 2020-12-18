import 'package:expression_language/expression_language.dart';

abstract class Expression<T> {
  T evaluate();
  Type getType() => T;
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap);
  List<Expression<dynamic>> getChildren();
}
