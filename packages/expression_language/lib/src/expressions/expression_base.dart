import '../visitors/expression_visitor.dart';

abstract class Expression<T> {
  T evaluate();
  void accept(ExpressionVisitor visitor);
  Type getType() => T;
}
