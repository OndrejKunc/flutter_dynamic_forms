import 'package:expression_language/expression_language.dart';

void main() {
  var expressionGrammarDefinition = ExpressionGrammarParser({});
  var parser = expressionGrammarDefinition.build();
  var result = parser.parse("\"Hello 1 + 1 equals: \" +  (1 + 1)");
  var expression = result.value as Expression;
  var value = expression.evaluate();
  print(value);
}
