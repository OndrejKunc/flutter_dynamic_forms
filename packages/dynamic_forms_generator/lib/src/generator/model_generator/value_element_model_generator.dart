import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class ValueElementModelGenerator extends ElementModelGenerator {
  @override
  String generateBody() {
    StringBuffer buffer = StringBuffer();
    for (var property in componentDescription.properties) {
      buffer.writeln(
          "  static const String ${property.name}PropertyName = \"${property.name}\";");
    }
    if (componentDescription.properties.isNotEmpty) {
      buffer.writeln();
    }

    for (var property in componentDescription.properties) {
      buffer
          .writeln("  final ${property.type.toTypeString()} ${property.name};");
    }

    if (componentDescription.properties.isNotEmpty) {
      buffer.writeln();
    }

    buffer.write("  ${componentDescription.type.toTypeString()}({");
    for (var property in componentDescription.properties) {
      buffer.write("@required this.${property.name},");
    }
    buffer.writeln("});");
    buffer.write(
        "  static defaultValue() => ${componentDescription.type.toTypeString()}(");
    for (var property in componentDescription.properties) {
      buffer.write(
          "${property.name}: ${getDefaultValue(property.type.toTypeString())},");
    }
    buffer.writeln(');');
    buffer.writeln('''
  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>''');
    buffer.write("  ${componentDescription.type.toTypeString()}(");
    for (var property in componentDescription.properties) {
      buffer.write("${property.name}: ${property.name},");
    }
    buffer.writeln(");");
    buffer.writeln('''
  @override
  ExpressionProvider getExpressionProvider([String propertyName]) {
    switch (propertyName) {''');
    for (var property in componentDescription.properties) {
      buffer.writeln('''
      case ${property.name}PropertyName:
        {
          return ImmutableElementValue(${property.name});
        }''');
    }
    buffer.writeln('''
    default:
      return null;''');
    buffer.writeln('    }');
    buffer.write('  }');
    buffer.writeln();
    return buffer.toString();
  }

  @override
  String generatePrelude() => "";
}
