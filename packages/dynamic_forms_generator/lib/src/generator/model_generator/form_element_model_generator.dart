import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class FormElementModelGenerator extends ElementModelGenerator {
  @override
  String generateBody() {
    var buffer = StringBuffer();
    for (var property in componentDescription.properties) {
      buffer.writeln(
          '  static const String ${property.name}PropertyName = \'${property.name}\';');
    }

    if (componentDescription.properties.isNotEmpty) {
      buffer.writeln();
    }

    for (var property in componentDescription.properties) {
      var propertyTypeName = 'Property<${property.type.toTypeString()}>';

      buffer.writeln(
          '  $propertyTypeName get ${property.name}Property => properties[${property.name}PropertyName];');

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

    return buffer.toString();
  }

  @override
  String generatePrelude() => '';
}
