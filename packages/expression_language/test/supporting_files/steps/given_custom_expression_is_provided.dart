import 'package:expression_language/expression_language.dart';
// ignore: import_of_legacy_library_into_null_safe
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
            createFunctionExpression: (parameters) => TestExpression(
                parameters[0] as Expression<String>,
                parameters[1] as Expression<String>),
            parametersLength: 2),
      ],
    );
  }

  @override
  RegExp get pattern => RegExp(r'custom expression is provided');
}
