import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_definition.dart';
import 'package:petitparser/petitparser.dart';

class ComponentTypeGrammarParser extends ComponentTypeGrammarDefinition {
  ComponentTypeGrammarParser({bool parseTypeDefinition = false})
      : super(parseTypeDefinition: parseTypeDefinition);

  @override
  Parser typeExpression() => super.typeExpression().map(
        (c) {
          ComponentType type;
          if (c[1] == null) {
            type = ComponentType(c[0], c[3] != null);
          } else {
            type = GenericType(c[0], c[3] != null, c[1][1]);
          }
          if (c[2] != null) {
            type = ArrayType(type, c[3] != null);
          }
          return type;
        },
      );

  @override
  Parser typeDefinitionExpression() => super.typeDefinitionExpression().map(
        (c) {
          ComponentType type;
          if (c[1] == null) {
            type = DefinitionType(c[0]);
          } else {
            type = GenericDefinitionType(c[0], c[1][1]);
          }
          return type;
        },
      );

  @override
  Parser listOfTypes() => super.listOfTypes().map(
        (c) {
          var result = <ComponentType>[];
          for (var i = 0; i < c[0].length; i++) {
            result.add(c[0][i][0]);
          }
          result.add(c[1]);
          return result;
        },
      );

  @override
  Parser listOfGenericDefinitionParameterTypes() =>
      super.listOfGenericDefinitionParameterTypes().map(
        (c) {
          var result = <GenericParameterType>[];
          for (var i = 0; i < c[0].length; i++) {
            result.add(c[0][i][0]);
          }
          result.add(c[1]);
          return result;
        },
      );

  @override
  Parser genericParameterTypeExpression() =>
      super.genericParameterTypeExpression().map(
        (c) {
          ComponentType? extendsType;
          if (c[1] != null) {
            extendsType = c[1][1];
          }
          return GenericParameterType(c[0], false, extendsType);
        },
      );
}
