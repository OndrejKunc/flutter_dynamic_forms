import 'package:expression_language/expression_language.dart';
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenDecimalExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, Decimal.parse(result));
  }

  @override
  RegExp get pattern => RegExp(r'decimal expression result is {string}');
}
