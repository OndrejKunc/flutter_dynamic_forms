import 'package:petitparser/petitparser.dart';

class ComponentTypeGrammarDefinition extends GrammarDefinition {
  start() => ref(typeExpression).end();

  Parser typeExpression() =>
      ref(identifier).flatten() & ref(genericParameters).optional() & ref(arraySymbol).optional();

  Parser genericParameters() =>
      ref(token, "<") & ref(listOfTypes) & ref(token, ">");
  Parser arraySymbol() => ref(token, "[]");

  Parser listOfTypes() =>
      (ref(typeExpression) & ref(token, ',')).star() & ref(typeExpression);

  Parser anyLetter() => letter();
  Parser anyDigit() => digit();

  Parser identifier() => ref(anyLetter) & (ref(anyLetter) | ref(anyDigit)).star();

  Parser token(Object input) {
    if (input is Parser) {
      return input.token().trim();
    } else if (input is String) {
      return token(input.length == 1 ? char(input) : string(input));
    } else if (input is Function) {
      return token(ref(input));
    }
    throw ArgumentError.value(input, 'invalid token parser');
  }
}
