import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

class ModelGenerator {
  final ComponentDescription componentDescription;
  final BuildConfiguration buildConfiguration;

  ModelGenerator({
    @required this.componentDescription,
    @required this.buildConfiguration,
  });

  String generate() {
    StringBuffer buffer = StringBuffer();

    buffer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
    buffer.writeln();

    for (var import in buildConfiguration.defaultImports) {
      buffer.writeln("import '$import';");
    }

    if (buildConfiguration.defaultImports.length > 0) {
      buffer.writeln();
    }

    buffer.writeln(
        "class ${componentDescription.type.toTypeString()} extends ${componentDescription.parentType.toTypeString()} {");

    for (var property in componentDescription.properties) {
      buffer.writeln(
          "  static const String ${property.name}PropertyName = \"${property.name}\";");
    }

    if (componentDescription.properties.length > 0) {
      buffer.writeln();
    }

    for (var property in componentDescription.properties) {
      buffer.writeln(
          "  ${property.type.toTypeString()} get ${property.name} => properties[${property.name}PropertyName].value;");
      buffer.writeln(
          "  Stream<${property.type.toTypeString()}> get ${property.name}Changed => properties[${property.name}PropertyName].valueChanged;");
      buffer.writeln();
    }

    buffer.writeln('''
  @override
  FormElement getInstance() {
    return ${componentDescription.type.toConstructorString()};
  }''');

    buffer.writeln("}");
    return buffer.toString();
  }
}
