class ComponentType {
  final String typeName;
  ComponentType(this.typeName);

  String toTypeString() {
    return typeName;
  }
}

class GenericType extends ComponentType {
  final List<ComponentType> genericParameters;

  GenericType(String typeName, this.genericParameters) : super(typeName);

  @override
  String toTypeString() {
    var joinedTypeParameters =
        genericParameters.map((t) => t.toTypeString()).join(",");
    return "$typeName<${joinedTypeParameters}>";
  }
}

class ArrayType extends ComponentType {
  final ComponentType innerType;

  ArrayType(this.innerType) : super(innerType.typeName);

  @override
  String toTypeString() {
    return "$typeName[]";
  }
}
