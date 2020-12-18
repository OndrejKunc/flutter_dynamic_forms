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
  List<Expression<dynamic>> getChildren() {
    return parameters;
  }

  @override
  Expression<T> clone(Map<String, ExpressionProviderElement> elementMap) {
    return CustomFunctionExpression(
        parameters.map((e) => e.clone(elementMap)).toList(), function);
  }
}

typedef CustomFunction<T> = T Function(List parameters);
