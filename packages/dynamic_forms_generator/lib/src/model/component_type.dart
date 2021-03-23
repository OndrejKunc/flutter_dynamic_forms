import 'package:dynamic_forms_generator/src/visitor/component_type_visitor.dart';

Set<String> lowerCaseTypes = {'int', 'bool', 'double'};

class ComponentType {
  final String typeName;
  final bool isNullable;
  ComponentType(this.typeName, this.isNullable);

  String get capitalizedTypeName => capitalize(typeName);
  String get nullableTypeText => isNullable ? '?' : '';

  String toTypeString() {
    return capitalize(typeName) + nullableTypeText;
  }

  String capitalize(String s) {
    if (lowerCaseTypes.contains(s)) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  void accept(ComponentTypeVisitor visitor) {
    visitor.visitComponentType(this);
  }
}

class GenericType extends ComponentType {
  final List<ComponentType> genericParameters;

  GenericType(String typeName, bool isNullable, this.genericParameters)
      : super(typeName, isNullable);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(',');
    return '${capitalize(typeName)}<${joinedTypeParameters}>$nullableTypeText';
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericType(this);
  }
}

class ArrayType extends ComponentType {
  final ComponentType innerType;

  ArrayType(this.innerType, bool isNullable)
      : super(innerType.typeName, isNullable);

  @override
  String toTypeString() {
    return 'List<${capitalize(typeName)}>$nullableTypeText';
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitArrayType(this);
  }
}

class GenericParameterType extends ComponentType {
  final ComponentType? extendsType;

  GenericParameterType(String typeName, bool isNullable, [this.extendsType])
      : super(typeName, isNullable);

  @override
  String toTypeString() {
    if (extendsType == null) {
      return typeName;
    }
    return '${capitalize(typeName)} extends ${extendsType!.toTypeString()}';
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericParameterType(this);
  }
}

class DefinitionType extends ComponentType {
  DefinitionType(String typeName) : super(typeName, false);

  String toConstructorString() {
    return '${capitalize(typeName)}()';
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitDefinitionType(this);
  }
}

class GenericDefinitionType extends DefinitionType {
  final List<GenericParameterType> genericParameters;

  GenericDefinitionType(String typeName, this.genericParameters)
      : super(typeName);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(',');
    return '${capitalize(typeName)}<${joinedTypeParameters}>$nullableTypeText';
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericDefinitionType(this);
  }
}
