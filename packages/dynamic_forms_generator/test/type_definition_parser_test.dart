import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_parser.dart';
import 'package:petitparser/petitparser.dart';
import 'package:test/test.dart';

void main() {
  late Parser parser;

  setUp(() {
    parser = ComponentTypeGrammarParser(parseTypeDefinition: true).build();
  });

  test('simple type', () {
    var result = parser.parse('type1').value as ComponentType;
    expect(result, isA<DefinitionType>());
    expect(result.typeName, 'type1');
    expect(result.isNullable, false);
  });

  test('definition cannot be nullable', () {
    expect(() => parser.parse('type1?').value,
        throwsA(TypeMatcher<ParserException>()));
  });

  test('single generic type', () {
    var result = parser.parse('type1<type2>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericDefinitionType>());
    expect((result as GenericDefinitionType).genericParameters[0].typeName,
        'type2');
    expect((result).genericParameters[0], isA<GenericParameterType>());
    expect(result.isNullable, false);
  });

  test('multiple generic types', () {
    var result = parser.parse('type1<type2, type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericDefinitionType>());
    expect((result as GenericDefinitionType).genericParameters[0].typeName,
        'type2');
    expect((result).genericParameters[1].typeName, 'type3');
  });

  test('single extends generic type', () {
    var result =
        parser.parse('type1<type2 extends type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericDefinitionType>());
    expect(((result as GenericDefinitionType).genericParameters[0]).typeName,
        'type2');
    expect(((result).genericParameters[0]).extendsType!.typeName, 'type3');
  });

  test('multiple extends generic type', () {
    var result = parser
        .parse('type1<type2 extends type3, type4 extends type5>')
        .value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericDefinitionType>());
    expect(
        (result as GenericDefinitionType)
            .genericParameters[0]
            .extendsType!
            .typeName,
        'type3');
    expect((result).genericParameters[1].extendsType!.typeName, 'type5');
  });

  test('nested type in extends', () {
    var result = parser.parse('type1<type2 extends type3<type4[]>>').value
        as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericDefinitionType>());
    expect(
        (((result as GenericDefinitionType).genericParameters[0].extendsType
                    as GenericType)
                .genericParameters[0] as ArrayType)
            .typeName,
        'type4');
  });
}
