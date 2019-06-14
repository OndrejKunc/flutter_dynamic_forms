import 'package:expression_language/expression_language.dart';

import '../expressions/expressions.dart';

abstract class ExpressionVisitor {
  void visitMutable<T>(MutableExpression<T> expression);
  void visitImmutable<T>(ImmutableExpression<T> expression);
  void visitConstant<T>(ConstantExpression<T> expression);
  void visitPlusNumber(PlusNumberExpression expression);
  void visitMinusNumber(MinusNumberExpression expression);
  void visitNegateNumber(NegateNumberExpression expression);
  void visitNegateBool(NegateBoolExpression expression);
  void visitPlusString(PlusStringExpression expression);
  void visitMultiply(MultiplyExpression expression);
  void visitLogicalAnd(LogicalAndExpression expression);
  void visitLogicalOr(LogicalOrExpression expression);
  void visitEqualNumber(EqualNumberExpression expression);
  void visitEqualBool(EqualBoolExpression expression);
  void visitEqualString(EqualStringExpression expression);
  void visitNotEqualNumber(NotEqualNumberExpression expression);
  void visitDivision(DivisionExpression expression);
  void visitModulo(ModuloExpression expression);
  void visitNotEqualBool(NotEqualBoolExpression expression);
  void visitNotEqualString(NotEqualStringExpression expression);
  void visitLessThan(LessThanExpression expression);
  void visitLessThanOrEqual(LessThanOrEqualExpression expression);
  void visitDelegate<T>(DelegateExpression<T> expression);
  void visitConditionalExpression<T>(ConditionalExpression<T> expression);
  void visitLengthFunction(LengthFunctionExpression expression);
  void visitToStringFunction(ToStringFunctionExpression expression);
  void visitListCountFunction<T>(ListCountFunctionExpression<T> expression);
}
