// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class ThenExceptionThrownResult
    extends Then1WithWorld<String, ExpressionWorld> {
  @override
  Future<void> executeStep(String result) async {
    expectMatch(world.result.runtimeType.toString(), result);
  }

  @override
  RegExp get pattern => RegExp(r'{string} exception is thrown');
}
