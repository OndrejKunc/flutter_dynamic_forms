// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenDateTimeExpressionResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result, DateTime.parse(result));
  }

  @override
  RegExp get pattern => RegExp(r'DateTime expression result is {string}');
}
