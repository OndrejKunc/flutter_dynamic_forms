import 'package:expression_language/expression_language.dart';
import '../expressions/expressions.dart';

abstract class TraversalExpressionsVisitor extends ExpressionVisitor {
  @override
  void visitConstant<T>(ConstantExpression<T> expression) {}

  @override
  void visitDelegate<T>(DelegateExpression<T> expression) {
    expression.getExpressionProvider<T>().getExpression().accept(this);
  }

  @override
  void visitConversion<TFrom, TTo extends TFrom>(
      ConversionExpression<TFrom, TTo> expression) {
    expression.value.accept(this);
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
  void visitEqualDateTime(EqualDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitEqualNumber(EqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitDivision(DivisionNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitIntegerDivisionNumber(IntegerDivisionNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitEqualString(EqualStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitEqualDuration(EqualDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLengthFunction(LengthFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitLessThanNumber(LessThanNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanDuration(LessThanDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanDateTime(LessThanDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanOrEqualNumber(LessThanOrEqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanOrEqualDuration(
      LessThanOrEqualDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitLessThanOrEqualDateTime(
      LessThanOrEqualDateTimeExpression expression) {
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
  void visitMultiply(MultiplyNumberExpression expression) {
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
  void visitDateTimePlusDuration(DateTimePlusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitDateTimeMinusDuration(DateTimeMinusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitPlusDuration(PlusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitMinusDuration(MinusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitMultiplyDuration(MultiplyDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitDivisionDuration(DivisionDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitNegateDuration(NegateDurationExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitToStringFunction(ToStringFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitIntToInteger(IntToIntegerExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitIntegerToInt(IntegerToIntExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDoubleToDecimal(DoubleToDecimalExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDecimalToDouble(DecimalToDoubleExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitListCountFunction<T>(ListCountFunctionExpression<T> expression) {
    expression.value.accept(this);
  }

  @override
  void visitRoundFunctionIntRoundingMode(
      RoundFunctionIntRoundingModeExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
    expression.roundingMode.accept(this);
  }

  @override
  void visitRoundFunctionStringRoundingMode(
      RoundFunctionStringRoundingModeExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
    expression.roundingMode.accept(this);
  }

  @override
  void visitRoundFunction(RoundFunctionExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
  }

  @override
  void visitDateTimeFunction(DateTimeFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDurationFunction(DurationFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitNowFunction(NowFunctionExpression expression) {}

  @override
  void visitNowInUtcFunction(NowInUtcFunctionExpression expression) {}

  @override
  void visitDiffDateTimeFunction(DiffDateTimeFunctionExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
  }

  @override
  void visitDurationInDaysFunction(
      DurationInDaysFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDurationInHoursFunction(
      DurationInHoursFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDurationInMinutesFunction(
      DurationInMinutesFunctionExpression expression) {
    expression.value.accept(this);
  }

  @override
  void visitDurationInSecondsFunction(
      DurationInSecondsFunctionExpression expression) {
    expression.value.accept(this);
  }
}
