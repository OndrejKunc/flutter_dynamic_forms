import 'dart:collection';
import 'package:expression_language/expression_language.dart';
import 'package:expression_language/src/visitors/expression_visitor.dart';

class CloneExpressionVisitor extends ExpressionVisitor {
  final Map<String, ExpressionProviderElement> _expressionProviderElementMap;
  final Queue<Expression> _expressionStack = Queue<Expression>();

  CloneExpressionVisitor(this._expressionProviderElementMap);

  void push(Expression expression) {
    _expressionStack.addLast(expression);
  }

  Expression pop() {
    return _expressionStack.removeLast();
  }

  Expression get result => _expressionStack.first;

  @override
  void visitConditionalExpression<T>(ConditionalExpression<T> expression) {
    expression.condition.accept(this);
    expression.trueValue.accept(this);
    expression.falseValue.accept(this);
    var falseValue = pop();
    var trueValue = pop();
    var condition = pop();
    push(ConditionalExpression<T>(condition, trueValue, falseValue));
  }

  @override
  void visitConstant<T>(ConstantExpression<T> expression) {
    push(ConstantExpression<T>(expression.value));
  }

  @override
  void visitDelegate<T>(DelegateExpression<T> expression) {
    var expressionPath = expression.expressionPath;
    var expressionProviderElement =
        _expressionProviderElementMap[expressionPath[0]];
    ExpressionProvider expressionProvider;
    if (expressionPath.length == 1) {
      expressionProvider = expressionProviderElement.getExpressionProvider();
      push(DelegateExpression<T>(expressionPath, expressionProvider));
      return;
    }
    for (var i = 1; i < expressionPath.length; i++) {
      var propertyName = expressionPath[i];
      expressionProvider =
          expressionProviderElement.getExpressionProvider(propertyName);
      if (expressionProvider is ExpressionProvider<ExpressionProviderElement>) {
        expressionProviderElement =
            expressionProvider.getExpression().evaluate();
      }
    }
    push(DelegateExpression<T>(expressionPath, expressionProvider));
  }

  @override
  void visitEqualBool(EqualBoolExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(EqualBoolExpression(left, right));
  }

  @override
  void visitEqualDateTime(EqualDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(EqualDateTimeExpression(left, right));
  }

  @override
  void visitEqualNumber(EqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(EqualNumberExpression(left, right));
  }

  @override
  void visitEqualDuration(EqualDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(EqualDurationExpression(left, right));
  }

  @override
  void visitDivision(DivisionNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(DivisionNumberExpression(left, right));
  }

  @override
  void visitIntegerDivisionNumber(IntegerDivisionNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(IntegerDivisionNumberExpression(left, right));
  }

  @override
  void visitEqualString(EqualStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(EqualStringExpression(left, right));
  }

  @override
  void visitNotEqualBool(NotEqualBoolExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(NotEqualBoolExpression(left, right));
  }

  @override
  void visitNotEqualDuration(NotEqualDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(NotEqualDurationExpression(left, right));
  }

  @override
  void visitNotEqualNumber(NotEqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(NotEqualNumberExpression(left, right));
  }

  @override
  void visitNotEqualString(NotEqualStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(NotEqualStringExpression(left, right));
  }

  @override
  void visitNotEqualDateTime(NotEqualDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(NotEqualDateTimeExpression(left, right));
  }

  @override
  void visitLengthFunction(LengthFunctionExpression expression) {
    expression.value.accept(this);
    push(LengthFunctionExpression(pop()));
  }

  @override
  void visitLessThanNumber(LessThanNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanNumberExpression(left, right));
  }

  @override
  void visitLessThanDuration(LessThanDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanDurationExpression(left, right));
  }

  @override
  void visitLessThanDateTime(LessThanDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanDateTimeExpression(left, right));
  }

  @override
  void visitLessThanOrEqualNumber(LessThanOrEqualNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanOrEqualNumberExpression(left, right));
  }

  @override
  void visitLessThanOrEqualDuration(
      LessThanOrEqualDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanOrEqualDurationExpression(left, right));
  }

  @override
  void visitLessThanOrEqualDateTime(
      LessThanOrEqualDateTimeExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LessThanOrEqualDateTimeExpression(left, right));
  }

  @override
  void visitLogicalAnd(LogicalAndExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LogicalAndExpression(left, right));
  }

  @override
  void visitLogicalOr(LogicalOrExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(LogicalOrExpression(left, right));
  }

  @override
  void visitNegateBool(NegateBoolExpression expression) {
    expression.value.accept(this);
    push(NegateBoolExpression(pop()));
  }

  @override
  void visitMultiply(MultiplyNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(MultiplyNumberExpression(left, right));
  }

  @override
  void visitModulo(ModuloExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(ModuloExpression(left, right));
  }

  @override
  void visitMutable<T>(MutableExpression<T> expression) {
    push(MutableExpression(expression.value));
  }

  @override
  void visitImmutable<T>(ImmutableExpression<T> expression) {
    push(ImmutableExpression(expression.value));
  }

  @override
  void visitPlusNumber(PlusNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(PlusNumberExpression(left, right));
  }

  @override
  void visitMinusNumber(MinusNumberExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(MinusNumberExpression(left, right));
  }

  @override
  void visitPlusString(PlusStringExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(PlusStringExpression(left, right));
  }

  @override
  void visitNegateNumber(NegateNumberExpression expression) {
    expression.value.accept(this);
    push(NegateNumberExpression(pop()));
  }

  @override
  void visitDateTimePlusDuration(DateTimePlusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(DateTimePlusDurationExpression(left, right));
  }

  @override
  void visitDateTimeMinusDuration(DateTimeMinusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(DateTimeMinusDurationExpression(left, right));
  }

  @override
  void visitPlusDuration(PlusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(PlusDurationExpression(left, right));
  }

  @override
  void visitMinusDuration(MinusDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(MinusDurationExpression(left, right));
  }

  @override
  void visitMultiplyDuration(MultiplyDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(MultiplyDurationExpression(left, right));
  }

  @override
  void visitDivisionDuration(DivisionDurationExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(DivisionDurationExpression(left, right));
  }

  @override
  void visitNegateDuration(NegateDurationExpression expression) {
    expression.value.accept(this);
    push(NegateDurationExpression(pop()));
  }

  @override
  void visitToStringFunction(ToStringFunctionExpression expression) {
    expression.value.accept(this);
    push(ToStringFunctionExpression(pop()));
  }

  @override
  void visitListCountFunction<T>(ListCountFunctionExpression<T> expression) {
    expression.value.accept(this);
    push(ListCountFunctionExpression(pop()));
  }

  @override
  void visitRoundFunctionIntRoundingMode(
      RoundFunctionIntRoundingModeExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
    expression.roundingMode.accept(this);
    var roundingMode = pop();
    var precision = pop();
    var value = pop();
    push(
        RoundFunctionIntRoundingModeExpression(value, precision, roundingMode));
  }

  @override
  void visitRoundFunctionStringRoundingMode(
      RoundFunctionStringRoundingModeExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
    expression.roundingMode.accept(this);
    var roundingMode = pop();
    var precision = pop();
    var value = pop();
    push(RoundFunctionStringRoundingModeExpression(
        value, precision, roundingMode));
  }

  @override
  void visitRoundFunction(RoundFunctionExpression expression) {
    expression.value.accept(this);
    expression.precision.accept(this);
    var precision = pop();
    var value = pop();
    push(RoundFunctionExpression(value, precision));
  }

  @override
  void visitDateTimeFunction(DateTimeFunctionExpression expression) {
    expression.value.accept(this);
    push(DateTimeFunctionExpression(pop()));
  }

  @override
  void visitDurationFunction(DurationFunctionExpression expression) {
    expression.value.accept(this);
    push(DurationFunctionExpression(pop()));
  }

  @override
  void visitNowFunction(NowFunctionExpression expression) {
    push(NowFunctionExpression());
  }

  @override
  void visitNowInUtcFunction(NowInUtcFunctionExpression expression) {
    push(NowInUtcFunctionExpression());
  }

  @override
  void visitDiffDateTimeFunction(DiffDateTimeFunctionExpression expression) {
    expression.left.accept(this);
    expression.right.accept(this);
    var right = pop();
    var left = pop();
    push(DiffDateTimeFunctionExpression(left, right));
  }

  @override
  void visitDurationInDaysFunction(
      DurationInDaysFunctionExpression expression) {
    expression.value.accept(this);
    push(DurationInDaysFunctionExpression(pop()));
  }

  @override
  void visitDurationInHoursFunction(
      DurationInHoursFunctionExpression expression) {
    expression.value.accept(this);
    push(DurationInHoursFunctionExpression(pop()));
  }

  @override
  void visitDurationInMinutesFunction(
      DurationInMinutesFunctionExpression expression) {
    expression.value.accept(this);
    push(DurationInMinutesFunctionExpression(pop()));
  }

  @override
  void visitDurationInSecondsFunction(
      DurationInSecondsFunctionExpression expression) {
    expression.value.accept(this);
    push(DurationInSecondsFunctionExpression(pop()));
  }
}
