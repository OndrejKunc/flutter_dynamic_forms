// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenBoolExpressionResult extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, result == 'true');
  }

  @override
  RegExp get pattern => RegExp(r'bool expression result is {string}');
}
