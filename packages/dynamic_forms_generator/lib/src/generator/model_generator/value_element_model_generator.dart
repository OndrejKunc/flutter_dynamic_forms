import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class ValueElementModelGenerator extends ElementModelGenerator {
  @override
  String generateBody() {
    var buffer = StringBuffer();

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln();

    for (var comment in comments) {
      buffer.writeln('//$comment');
    }

    for (var import in imports) {
      buffer.writeln("import '$import';");
    }

    if (imports.isNotEmpty) {
      buffer.writeln();
    }

    buffer.writeln(
        'class ${componentDescription.type.toTypeString()} extends ${componentDescription.parentType!.toTypeString()} {');

    for (var property in componentDescription.properties) {
      buffer.writeln(
          '  static const String ${property.name}PropertyName = \'${property.name}\';');
    }
    if (componentDescription.properties.isNotEmpty) {
      buffer.writeln();
    }

    for (var property in componentDescription.properties) {
      buffer
          .writeln('  final ${property.type.toTypeString()} ${property.name};');
    }

    if (componentDescription.properties.isNotEmpty) {
      buffer.writeln();
    }

    buffer.writeln('  ${componentDescription.type.toTypeString()}({');
    for (var property in componentDescription.properties) {
      var defaultValue = getDefaultValue(property.type.typeName);
      if (defaultValue != null) {
        buffer.writeln('    this.${property.name} = ${defaultValue},');
      } else {
        buffer.writeln('    this.${property.name},');
      }
    }
    buffer.writeln('  });');
    buffer.writeln('''
  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>''');
    buffer.writeln('  ${componentDescription.type.toTypeString()}(');
    for (var property in componentDescription.properties) {
      buffer.writeln('    ${property.name}: ${property.name},');
    }
    buffer.writeln('  );');
    buffer.writeln('''
  @override
  ExpressionProvider getExpressionProvider([String? propertyName]) {
    switch (propertyName) {''');
    for (var property in componentDescription.properties) {
      buffer.writeln('''
      case ${property.name}PropertyName:
        {
          return ImmutableProperty(${property.name});
        }''');
    }
    buffer.writeln('''
    default:
      throw Exception('Unknown propertyName \$propertyName');''');
    buffer.writeln('    }');
    buffer.write('  }');
    buffer.writeln();
    buffer.writeln('}');
    return buffer.toString();
  }
}
