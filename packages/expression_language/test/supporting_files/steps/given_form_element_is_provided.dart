// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class GivenFormElementIsProvided extends GivenWithWorld<ExpressionWorld> {
  @override
  Future<void> executeStep() async {
    world.buildGrammarParser(
      {
        'testElement': TestElement(),
        'underscore_test_element': TestElement(),
      },
    );
  }

  @override
  RegExp get pattern => RegExp(r'form element is provided');
}
