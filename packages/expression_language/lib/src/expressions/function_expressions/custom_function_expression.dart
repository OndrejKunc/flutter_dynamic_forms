import 'package:expression_language/expression_language.dart';

class CustomFunctionExpression<T> extends Expression<T> {
  final List<Expression> parameters;
  final CustomFunction function;

  CustomFunctionExpression(this.parameters, this.function);

  @override
  T evaluate() {
    return function(parameters.map((e) => e.evaluate()).toList());
  }

  @override
  void accept(ExpressionVisitor visitor) {
    visitor.visitCustomFunction(this);
  }
}

typedef CustomFunction<T> = T Function(List parameters);
