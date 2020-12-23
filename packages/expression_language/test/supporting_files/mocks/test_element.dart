import 'package:expression_language/expression_language.dart';

import '../index.dart';

class TestElement extends ExpressionProviderElement {
  Map<String, ExpressionProvider> properties = {
    'value': ConstantExpressionProvider<Integer>(Integer(27)),
    'label': ConstantExpressionProvider<String>('LabelText'),
    'nullLabel': ConstantExpressionProvider<String>(null),
    'emptyLabel': ConstantExpressionProvider<String>(''),
    'intValue': ConstantExpressionProvider<int>(14),
    'doubleValue': ConstantExpressionProvider<double>(6.5),
    'dateValue': ConstantExpressionProvider<DateTime>(DateTime(2020)),
  };

  @override
  String id;

  @override
  ExpressionProvider getExpressionProvider([String propertyName]) {
    if (propertyName == null || propertyName == '') {
      propertyName = 'value';
    }
    return properties[propertyName];
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    //Nothing to do
    return null;
  }
}
