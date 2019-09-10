import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_definition.dart';
import 'package:petitparser/petitparser.dart';

class ComponentTypeGrammarParser extends ComponentTypeGrammarDefinition {
  Parser typeExpression() => super.typeExpression().map((c) {
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
      });

  Parser listOfTypes() => super.listOfTypes().map((c) {
        var result = List<ComponentType>();
        for (var i = 0; i < c[0].length; i++) {
          result.add(c[0][i][0]);
        }
        result.add(c[1]);
        return result;
      });
}
