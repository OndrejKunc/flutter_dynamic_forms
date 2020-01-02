import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class CloneableExpressionProperty<T> extends ExpressionProperty<T> {
  Expression<T> _expression;
  Expression<T> _oldExpression;
  CloneableExpressionProperty(this._oldExpression);

  void buildExpression(
      Map<String, ExpressionProviderElement> expressionProviderElementMap) {
    var cloneVisitor = CloneExpressionVisitor(expressionProviderElementMap);
    _oldExpression.accept(cloneVisitor);
    _expression = cloneVisitor.result as Expression<T>;
  }

  @override
  Expression<T> getExpression() => _expression;
}
