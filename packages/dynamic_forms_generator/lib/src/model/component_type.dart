import 'package:dynamic_forms_generator/src/visitor/comopnent_type_visitor.dart';

Set<String> lowerCaseTypes = {"int", "bool", "double"};

class ComponentType {
  final String typeName;
  ComponentType(this.typeName);

  String get capitalizedTypeName => capitalize(typeName);

  String toTypeString() {
    return capitalize(typeName);
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

  GenericType(String typeName, this.genericParameters) : super(typeName);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(",");
    return "${capitalize(typeName)}<${joinedTypeParameters}>";
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericType(this);
  }
}

class ArrayType extends ComponentType {
  final ComponentType innerType;

  ArrayType(this.innerType) : super(innerType.typeName);

  @override
  String toTypeString() {
    return "List<${capitalize(typeName)}>";
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitArrayType(this);
  }
}

class GenericParameterType extends ComponentType {
  final ComponentType extendsType;

  GenericParameterType(String typeName, [this.extendsType]) : super(typeName);

  @override
  String toTypeString() {
    if (extendsType == null) {
      return typeName;
    }
    return "${capitalize(typeName)} extends ${extendsType.toTypeString()}";
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericParameterType(this);
  }
}

class DefinitionType extends ComponentType {
  DefinitionType(String typeName) : super(typeName);

  String toConstructorString() {
    return "${capitalize(typeName)}()";
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
        genericParameters.map((t) => t.toTypeString()).join(",");
    return "${capitalize(typeName)}<${joinedTypeParameters}>";
  }

  @override
  void accept(ComponentTypeVisitor visitor) {
    visitor.visitGenericDefinitionType(this);
  }
}
