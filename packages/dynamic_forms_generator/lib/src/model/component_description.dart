import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:meta/meta.dart';

class ComponentDescription {
  final ComponentType type;
  final ComponentType parentType;
  final List<PropertyDescription> properties;
  final PropertyDescription conentProperty;
  final List<String> namespaces;

  ComponentDescription({
    @required this.type,
    this.parentType,
    this.properties,
    this.conentProperty,
    this.namespaces,
  });
}

class PropertyDescription {
  final String name;
  final ComponentType type;
  final String defaultValue;
  final bool isMutable;

  PropertyDescription({
    @required this.name,
    @required this.type,
    this.defaultValue,
    this.isMutable = false,
  });
}
