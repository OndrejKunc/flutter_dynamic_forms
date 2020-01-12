import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:meta/meta.dart';

class ComponentDescription {
  DefinitionType type;
  ComponentType parentType;
  List<PropertyDescription> properties;
  PropertyDescription contentProperty;
  List<String> namespaces;
  List<String> values;

  ComponentDescription({
    @required this.type,
    this.parentType,
    this.properties,
    this.contentProperty,
    this.namespaces,
    this.values,
  });
}

class PropertyDescription {
  String name;
  ComponentType type;
  String defaultValue;
  bool isMutable;
  bool isEnum;

  PropertyDescription({
    @required this.name,
    @required this.type,
    this.defaultValue,
    this.isMutable = false,
    this.isEnum,
  });
}
