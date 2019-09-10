import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/model/raw_component_description.dart';
import 'package:dynamic_forms_generator/src/parser/component_type_grammar_parser.dart';

class ComponentDescriptionBuilder {
  ComponentDescription buildFromRawComponent(
      RawComponentDescription rawComponent) {
    var parser = ComponentTypeGrammarParser().build();
    ComponentType type = parser.parse(rawComponent.type).value;

    List<String> genericParameters;
    if (type is GenericType) {
      genericParameters = type.genericParameters.map((g) => g.typeName);
    }

    ComponentType parentType;
    if (rawComponent.parentType != null) {
      parentType = parser.parse(rawComponent.parentType).value;
    }

    List<PropertyDescription> properties = [];
    if (rawComponent.properties != null) {
      for (var rawProperty in rawComponent.properties) {
        var propertyType = parser.parse(rawProperty.type).value;
        var isMutable = rawProperty.isMutable;
        properties.add(
          PropertyDescription(
            name: rawProperty.name,
            type: propertyType,
            defaultValue: rawProperty.defaultValue,
            isMutable: isMutable,
          ),
        );
      }
    }

    PropertyDescription contentProperty;
    if (rawComponent.contentProperty != null) {
      contentProperty =
          properties.firstWhere((p) => p.name == rawComponent.contentProperty);
    }

    return ComponentDescription(
      type: type,
      parentType: parentType,
      properties: properties,
      conentProperty: contentProperty,
    );
  }
}
