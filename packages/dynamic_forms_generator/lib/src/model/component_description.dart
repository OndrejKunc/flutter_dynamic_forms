import 'package:dynamic_forms_generator/src/model/component_type.dart';

class ComponentDescription {
  DefinitionType type;
  ComponentType? parentType;
  List<PropertyDescription> properties;
  PropertyDescription? contentProperty;
  List<String> namespaces;
  List<String> values;

  ComponentDescription({
    required this.type,
    this.parentType,
    this.properties = const [],
    this.contentProperty,
    this.namespaces = const [],
    this.values = const [],
  });
}

class PropertyDescription {
  String name;
  ComponentType type;
  String? defaultValue;
  bool isMutable;
  bool isEnum;

  PropertyDescription({
    required this.name,
    required this.type,
    this.defaultValue,
    this.isMutable = false,
    this.isEnum = false,
  });
}
