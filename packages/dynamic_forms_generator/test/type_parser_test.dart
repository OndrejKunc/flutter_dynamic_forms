import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_parser.dart';
import 'package:petitparser/petitparser.dart';
import 'package:test/test.dart';

void main() {
  late Parser parser;

  setUp(() {
    parser = ComponentTypeGrammarParser().build();
  });

  test('simple type', () {
    var result = parser.parse('type1').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result.isNullable, false);
  });

  test('simple nullable type', () {
    var result = parser.parse('type1?').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result.isNullable, true);
  });

  test('array type', () {
    var result = parser.parse('type[]').value as ComponentType;
    expect(result.typeName, 'type');
    expect(result, isA<ArrayType>());
    expect((result as ArrayType).innerType.typeName, 'type');
    expect(result.isNullable, false);
  });

  test('nullable array type', () {
    var result = parser.parse('type[]?').value as ComponentType;
    expect(result.typeName, 'type');
    expect(result, isA<ArrayType>());
    expect((result as ArrayType).innerType.typeName, 'type');
    expect(result.isNullable, true);
  });

  test('single generic type', () {
    var result = parser.parse('type1<type2>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.isNullable, false);
  });

  test('single nullable generic type', () {
    var result = parser.parse('type1<type2>?').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.isNullable, true);
  });

  test('single inner nullable generic type', () {
    var result = parser.parse('type1<type2?>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.isNullable, false);
    expect(result.genericParameters[0].isNullable, true);
  });

  test('single inner and outer nullable generic type', () {
    var result = parser.parse('type1<type2?>?').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.isNullable, true);
    expect(result.genericParameters[0].isNullable, true);
  });

  test('multiple generic types', () {
    var result = parser.parse('type1<type2, type3>').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.genericParameters[1].typeName, 'type3');
  });

  test('multiple nullable generic types', () {
    var result = parser.parse('type1<type2?, type3?>?').value as ComponentType;
    expect(result.typeName, 'type1');
    expect(result, isA<GenericType>());
    expect((result as GenericType).genericParameters[0].typeName, 'type2');
    expect(result.genericParameters[1].typeName, 'type3');
    expect(result.isNullable, true);
    expect(result.genericParameters[0].isNullable, true);
    expect(result.genericParameters[1].isNullable, true);
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
