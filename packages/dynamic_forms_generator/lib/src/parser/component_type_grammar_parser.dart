import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_definition.dart';
import 'package:petitparser/petitparser.dart';

class ComponentTypeGrammarParser extends ComponentTypeGrammarDefinition {
  ComponentTypeGrammarParser({bool parseTypeDefinition = false})
      : super(parseTypeDefinition: parseTypeDefinition);

  Parser typeExpression() => super.typeExpression().map(
        (c) {
          ComponentType type;
          if (c[1] == null) {
            type = ComponentType(c[0]);
          } else {
            type = GenericType(c[0], c[1][1]);
          }
          if (c[2] != null) {
            type = ArrayType(type);
          }
          return type;
        },
      );

  Parser typeDefinitionExpression() => super.typeDefinitionExpression().map(
        (c) {
          ComponentType type;
          if (c[1] == null) {
            type = GenericDefinitionType(c[0]);
          } else {
            type = GenericDefinitionType(c[0], c[1][1]);
          }
          return type;
        },
      );

  Parser listOfTypes() => super.listOfTypes().map(
        (c) {
          var result = List<ComponentType>();
          for (var i = 0; i < c[0].length; i++) {
            result.add(c[0][i][0]);
          }
          result.add(c[1]);
          return result;
        },
      );

  Parser listOfGenericDefinitionParameterTypes() =>
      super.listOfGenericDefinitionParameterTypes().map(
        (c) {
          var result = List<GenericParameterType>();
          for (var i = 0; i < c[0].length; i++) {
            result.add(c[0][i][0]);
          }
          result.add(c[1]);
          return result;
        },
      );

  Parser genericParameterTypeExpression() =>
      super.genericParameterTypeExpression().map(
        (c) {
          ComponentType extendsType;
          if (c[1] != null) {
            extendsType = c[1][1];
          }
          return GenericParameterType(c[0], extendsType);
        },
      );
}
