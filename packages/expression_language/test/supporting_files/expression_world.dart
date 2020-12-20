import 'package:expression_language/expression_language.dart';
import 'package:gherkin/gherkin.dart';
import 'package:petitparser/petitparser.dart';

class ExpressionWorld extends World {
  ExpressionGrammarParser grammarParser;
  Object result;
  Parser parser;

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
