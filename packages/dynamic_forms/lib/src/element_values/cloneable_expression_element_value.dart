import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class CloneableExpressionElementValue<T> extends ExpressionElementValue<T> {
  Expression<T> _expression;
  Expression<T> _oldExpression;
  CloneableExpressionElementValue(this._oldExpression);

  void buildExpression(Map<String, ExpressionProviderElement> expressionProviderElementMap) {
    var cloneVisitor = CloneExpressionVisitor(expressionProviderElementMap);
    _oldExpression.accept(cloneVisitor);
    _expression = cloneVisitor.result as Expression<T>;
  }

  @override
  Expression<T> getExpression() => _expression;
}