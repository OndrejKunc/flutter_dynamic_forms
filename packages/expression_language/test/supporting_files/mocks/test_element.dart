import 'package:expression_language/expression_language.dart';

import '../index.dart';

class TestElement extends ExpressionProviderElement {
  Map<String, ExpressionProvider> properties = {
    'value': ConstantExpressionProvider<Integer>(Integer(27)),
    'nullableIntegerValue': ConstantExpressionProvider<Integer?>(Integer(27)),
    'nullIntegerValue': ConstantExpressionProvider<Integer?>(null),
    'decimalValue':
        ConstantExpressionProvider<Decimal>(Decimal.fromDouble(6.5)),
    'nullableDecimalValue':
        ConstantExpressionProvider<Decimal?>(Decimal.fromDouble(6.5)),
    'label': ConstantExpressionProvider<String>('LabelText'),
    'nullLabel': ConstantExpressionProvider<String?>(null),
    'emptyLabel': ConstantExpressionProvider<String>(''),
    'intValue': ConstantExpressionProvider<int>(14),
    'nullableIntValue': ConstantExpressionProvider<int?>(14),
    'doubleValue': ConstantExpressionProvider<double>(6.5),
    'nullableDoubleValue': ConstantExpressionProvider<double?>(6.5),
    'dateValue': ConstantExpressionProvider<DateTime>(DateTime(2020)),
    'nullableDateValue': ConstantExpressionProvider<DateTime?>(DateTime(2020)),
    'nullableBoolValue': ConstantExpressionProvider<bool?>(true),
    'durationValue': ConstantExpressionProvider<Duration>(Duration(seconds: 1)),
    'nullableDurationValue':
        ConstantExpressionProvider<Duration?>(Duration(seconds: 1)),
  };

  @override
  String? id;

  @override
  ExpressionProvider getExpressionProvider([String? propertyName]) {
    if (propertyName == null || propertyName == '') {
      propertyName = 'value';
    }
    return properties[propertyName]!;
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    return this;
  }
}
