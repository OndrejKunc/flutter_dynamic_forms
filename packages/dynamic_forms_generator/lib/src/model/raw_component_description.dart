import 'package:meta/meta.dart';

class RawComponentDescription {
  final String type;
  final String parentType;
  final List<RawPropertyDescription> properties;
  final String contentProperty;

  RawComponentDescription({
    @required this.type,
    this.parentType,
    this.properties = const [],
    this.contentProperty,
  });
}

class RawPropertyDescription {
  final String name;
  final String type;
  final String defaultValue;
  final bool isMutable;

  RawPropertyDescription({
    @required this.name,
    @required this.type,
    this.defaultValue,
    this.isMutable,
  });
}
