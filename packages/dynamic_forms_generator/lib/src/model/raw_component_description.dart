class RawComponentDescription {
  final String type;
  final String? parentType;
  final List<RawPropertyDescription> properties;
  final List<String> values;
  final String? contentProperty;

  RawComponentDescription({
    required this.type,
    this.parentType,
    this.properties = const [],
    this.values = const [],
    this.contentProperty,
  });
}

class RawPropertyDescription {
  final String name;
  final String type;
  final String? defaultValue;
  final bool isMutable;
  final bool isEnum;

  RawPropertyDescription({
    required this.name,
    required this.type,
    this.defaultValue,
    this.isMutable = false,
    this.isEnum = false,
  });
}
