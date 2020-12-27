import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenStringExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, result);
  }

  @override
  RegExp get pattern => RegExp(r'string expression result is {string}');
}
