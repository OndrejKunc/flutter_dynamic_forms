import 'package:petitparser/petitparser.dart';

class ComponentTypeGrammarDefinition extends GrammarDefinition {
  final bool parseTypeDefinition;

  ComponentTypeGrammarDefinition({this.parseTypeDefinition = false});

  @override
  Parser start() {
    if (parseTypeDefinition) {
      return ref(typeDefinitionExpression).end();
    }
    return ref(typeExpression).end();
  }

  Parser typeExpression() =>
      ref(identifier).flatten() &
      ref(genericParameters).optional() &
      ref(arraySymbol).optional() &
      ref(nullableSymbol).optional();

  Parser typeDefinitionExpression() =>
      ref(identifier).flatten() & ref(genericDefinitionParameters).optional();

  Parser genericParameters() =>
      ref(token, '<') & ref(listOfTypes) & ref(token, '>');

  Parser arraySymbol() => ref(token, '[]');
  Parser nullableSymbol() => ref(token, '?');

  Parser genericDefinitionParameters() =>
      ref(token, '<') &
      ref(listOfGenericDefinitionParameterTypes) &
      ref(token, '>');

  Parser listOfTypes() =>
      (ref(typeExpression) & ref(token, ',')).star() & ref(typeExpression);

  Parser listOfGenericDefinitionParameterTypes() =>
      (ref(genericParameterTypeExpression) & ref(token, ',')).star() &
      ref(genericParameterTypeExpression);

  Parser genericParameterTypeExpression() =>
      ref(identifier).flatten() &
      (ref(token, 'extends') & ref(typeExpression)).optional();

  Parser anyLetter() => letter();
  Parser anyDigit() => digit();

  Parser identifier() =>
      ref(anyLetter) & (ref(anyLetter) | ref(anyDigit)).star();

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
