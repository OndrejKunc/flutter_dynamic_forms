import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class CloneableExpressionProperty<T> extends ExpressionProperty<T> {
  late Expression<T> _expression;
  final Expression<T> _oldExpression;
  CloneableExpressionProperty(this._oldExpression);

  void buildExpression(
      Map<String, ExpressionProviderElement> expressionProviderElementMap) {
    var clonedExpression = _oldExpression.clone(expressionProviderElementMap);
    _expression = clonedExpression;
  }

  @override
  Expression<T> getExpression() => _expression;
}
