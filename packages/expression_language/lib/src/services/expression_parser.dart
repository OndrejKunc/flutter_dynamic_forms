import 'package:expression_language/expression_language.dart';
import 'package:petitparser/petitparser.dart';

class ExpressionParser {
  final Parser parser;

  ExpressionParser._internal(this.parser);

  factory ExpressionParser(Map<String, ExpressionProviderElement> elementMap) {
    var expressionGrammarDefinition = ExpressionGrammarParser(elementMap);
    var parser = expressionGrammarDefinition.build();
    return ExpressionParser._internal(parser);
  }

  Expression parse(String expressionString) {
    var result = parser.parse(expressionString);
    return result.value;
  }
}
