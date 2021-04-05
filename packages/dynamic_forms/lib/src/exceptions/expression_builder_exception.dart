import 'package:dynamic_forms/dynamic_forms.dart';

class ExpressionBuilderException implements Exception {
  final StringExpressionProperty<dynamic> expressionProperty;
  final dynamic originalException;
  final StackTrace? stackTrace;
  ExpressionBuilderException(this.expressionProperty, this.originalException,
      [this.stackTrace]);
  @override
  String toString() {
    return 'Error while building an expression from the expression String.\n'
        'Expression Property: $expressionProperty\n'
        'Original Exception: $originalException\n'
        '${stackTrace ?? ''}';
  }
}
