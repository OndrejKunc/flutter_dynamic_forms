import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class FormElementModelGenerator extends ElementModelGenerator {
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
      var propertyTypeName = 'Property<${property.type.toTypeString()}>';

      if (stronglyCastProperties) {
        buffer.writeln('  $propertyTypeName get ${property.name}Property =>');
        buffer.writeln(
            '      properties[${property.name}PropertyName] as $propertyTypeName;');
      } else {
        buffer.writeln(
            '  $propertyTypeName get ${property.name}Property => properties[${property.name}PropertyName] as $propertyTypeName;');
      }

      buffer.writeln(
          '  set ${property.name}Property($propertyTypeName value) =>');
      buffer.writeln(
          '      registerProperty(${property.name}PropertyName, value);');

      buffer
          .writeln('  ${property.type.toTypeString()} get ${property.name} =>');
      buffer.writeln('      ${property.name}Property.value;');

      buffer.writeln(
          '  Stream<${property.type.toTypeString()}> get ${property.name}Changed => ${property.name}Property.valueChanged;');
      buffer.writeln();
    }

    buffer.writeln('''
  @override
  FormElement getInstance() {
    return ${componentDescription.type.toConstructorString()};
  }''');

    buffer.writeln('}');
    return buffer.toString();
  }
}
