import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:petitparser/petitparser.dart';

class StringExpressionElementValue<T> extends ExpressionElementValue<T> {
  Expression<T> _expression;
  final String _expressionString;

  StringExpressionElementValue(this._expressionString);

  void buildExpression(Parser parser) {
    var result = parser.parse(_expressionString);
    var resultExpression = result.value as Expression;
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
