import 'package:expression_language/expression_language.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenIntExpressionResult extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, Integer.parse(result));
  }

  @override
  RegExp get pattern => RegExp(r'int expression result is {string}');
}
