import 'dart:collection';

import 'package:expression_language/expression_language.dart';

extension ExpressionExtensions<T> on Expression<T> {
  Iterable<Expression<dynamic>> getIterator() sync* {
    var stack = Queue<Expression<dynamic>>.from([this]);
    var visitedExpressions = {this};
    while (stack.isNotEmpty) {
      var expression = stack.removeLast();
      visitedExpressions.add(expression);
      yield expression;

      var childExpressions = expression.getChildren();
      childExpressions.forEach((e) {
        if (!visitedExpressions.contains(e)) {
          stack.addLast(e);
        }
      });
    }
  }

  List<ExpressionProvider> getExpressionProviders() {
    return getIterator()
        .whereType<DelegateExpression>()
        .map((e) => e.getExpressionProvider())
        .toList();
  }
}
