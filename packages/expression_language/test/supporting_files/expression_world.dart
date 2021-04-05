import 'package:expression_language/expression_language.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';
import 'package:petitparser/petitparser.dart';

class ExpressionWorld extends World {
  late ExpressionGrammarParser grammarParser;
  Object? result;
  late Parser parser;

  ExpressionWorld() {
    grammarParser = ExpressionGrammarParser({});
    parser = grammarParser.build();
  }

  void buildGrammarParser(
    Map<String, ExpressionProviderElement> expressionProviderElementMap, {
    List<FunctionExpressionFactory> customFunctionExpressionFactories =
        const [],
  }) {
    grammarParser = ExpressionGrammarParser(expressionProviderElementMap,
        customFunctionExpressionFactories: customFunctionExpressionFactories);
    parser = grammarParser.build();
  }
}
