import 'package:expression_language/expression_language.dart';
import 'package:gherkin/gherkin.dart';

import '../index.dart';

class GivenCustomExpressionIsProvided extends GivenWithWorld<ExpressionWorld> {
  @override
  Future<void> executeStep() async {
    world.buildGrammarParser(
      {},
      customFunctionExpressionFactories: [
        ExplicitFunctionExpressionFactory(
            name: 'testExpression',
            createFunctionExpression: (parameters) =>
                TestExpression(parameters[0], parameters[1]),
            parametersLength: 2),
      ],
    );
  }

  @override
  RegExp get pattern => RegExp(r'custom expression is provided');
}
