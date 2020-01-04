import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_parser.dart';
import 'package:petitparser/petitparser.dart';
import 'package:test/test.dart';

void main() {
  Parser parser;

  setUp(() {
    parser = ComponentTypeGrammarParser().build();
  });

  test('simple type', () {
    var result = parser.parse('type1').value as ComponentType;
    expect(result.typeName, 'type1');
  });

  test('array type', () {
    var result = parser.parse('type[]').value as ComponentType;
    expect(result.typeName, 'type');
    expect(result, isA<ArrayType>());
    expect((result as ArrayType).innerType.typeName, 'type');
  });

  test('single generic type', () {
    var result = parser.parse('type1<type2>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
  });

  test('multiple generic types', () {
    var result = parser.parse('type1<type2, type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect((result as GenericType).genericParameters[1].typeName, 'type3');
  });

  test('nested generic types', () {
    var result =
        parser.parse('type1<type2<type4>, type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect(
        ((result as GenericType).genericParameters[0] as GenericType)
            .genericParameters[0]
            .typeName,
        'type4');
  });

  test('nested generic array', () {
    var result = parser.parse('type1<type2[], type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect(((result as GenericType).genericParameters[0] as ArrayType).typeName,
        'type2');
  });

  test('generic array', () {
    var result = parser.parse('type1<type2[], type3>[]').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<ArrayType>());
    expect(
        (((result as ArrayType).innerType as GenericType).genericParameters[0]
                as ArrayType)
            .typeName,
        'type2');
  });
}
