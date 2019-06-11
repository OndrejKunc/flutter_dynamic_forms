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

abstract class TraversalExpressionsVisitor extends ExpressionVisitor {
  @override
  void visitConstant<T>(ConstantExpression<T> expression) {}

  @override
  void visitDelegate<T>(DelegateExpression<T> expression) {
    expression.getExpressionProvider<T>().getExpression().accept(this);
  }

  @override
  void visitConditionalExpression<T>(ConditionalExpression<T> expression) {
    expression.condition.accept(this);
    expression.trueValue.accept(this);
    expression.falseValue.accept(this);
  }

  @override
  void visitEqualBool(EqualBoolExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitEqualNumber(EqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitDivision(DivisionExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }


  @override
  void visitEqualString(EqualStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNotEqualBool(NotEqualBoolExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNotEqualNumber(NotEqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNotEqualString(NotEqualStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLengthFunction(LengthFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitLessThan(LessThanExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanOrEqual(LessThanOrEqualExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLogicalAnd(LogicalAndExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLogicalOr(LogicalOrExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNegateBool(NegateBoolExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitMultiply(MultiplyExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitModulo(ModuloExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitMutable<T>(MutableExpression<T> expression) {}

  @override
  void visitImmutable<T>(ImmutableExpression<T> expression) {}

  @override
  void visitPlusNumber(PlusNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitMinusNumber(MinusNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitPlusString(PlusStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNegateNumber(NegateNumberExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitToStringFunction(ToStringFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitListCountFunction<T>(ListCountFunctionExpression<T> expression) {
    expression.value.accept(this);
  }
}

class ElementsValueCollectorVisitor extends TraversalExpressionsVisitor {
  final List<ExpressionProvider> elementsValues = [];

  @override
  void visitDelegate<T>(DelegateExpression<T> expression) {
    elementsValues.add(expression.getExpressionProvider());
  }
}

