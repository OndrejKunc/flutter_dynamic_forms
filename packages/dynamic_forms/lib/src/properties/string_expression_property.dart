import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class StringExpressionProperty<T> extends ExpressionProperty<T> {
  late Expression<T> _expression;
  final String _expressionString;

  StringExpressionProperty(this._expressionString);

  void buildExpression(ExpressionParser parser) {
    var resultExpression = parser.parse(_expressionString);
    if (resultExpression.getType() == Integer &&
        resultExpression is Expression<Number>) {
      resultExpression =
          ConversionExpression<Number, Integer>(resultExpression);
    } else if (resultExpression.getType() == Decimal &&
        resultExpression is Expression<Number>) {
      resultExpression =
          ConversionExpression<Number, Decimal>(resultExpression);
    }

    if (T == int && resultExpression is Expression<Integer>) {
      _expression = IntegerToIntExpression(resultExpression) as Expression<T>;
    } else if (T == double && resultExpression is Expression<Decimal>) {
      _expression =
          DecimalToDoubleExpression(resultExpression) as Expression<T>;
    } else {
      _expression = resultExpression as Expression<T>;
    }
  }

  @override
  Expression<T> getExpression() => _expression;
}
