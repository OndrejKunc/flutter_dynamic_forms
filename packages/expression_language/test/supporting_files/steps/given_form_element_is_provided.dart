import 'package:gherkin/gherkin.dart';

import '../index.dart';

class GivenFormElementIsProvided extends GivenWithWorld<ExpressionWorld> {
  @override
  Future<void> executeStep() async {
    world.buildGrammarParser(
      {
        'testElement': TestElement(),
      },
    );
  }

  @override
  RegExp get pattern => RegExp(r'form element is provided');
}
