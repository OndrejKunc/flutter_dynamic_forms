import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class FormElementModelGenerator extends ElementModelGenerator {
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
      buffer.writeln(
          "  ${property.type.toTypeString()} get ${property.name} => properties[${property.name}PropertyName].value;");
      buffer.writeln(
          "  Stream<${property.type.toTypeString()}> get ${property.name}Changed => properties[${property.name}PropertyName].valueChanged;");
      buffer.writeln();
    }

    buffer.writeln(
        "  void fill${componentDescription.type.capitalizedTypeName}({");

    for (var property in allProperties) {
      var typeName = property.name == "id"
          ? "String"
          : "ElementValue<${property.type.toTypeString()}>";
      buffer.writeln("    @required $typeName ${property.name},");
    }

    buffer.writeln("  }) {");

    buffer.writeln(
        "    fill${componentDescription.parentType.capitalizedTypeName}(");

    for (var property in allProperties.where(
        (p) => !componentDescription.properties.any((c) => c.name == p.name))) {
      buffer.writeln("      ${property.name}: ${property.name},");
    }

    buffer.writeln("    );");

    for (var property in componentDescription.properties) {
      buffer.writeln(
          "    registerElementValue(${property.name}PropertyName, ${property.name});");
    }

    buffer.writeln("  }");
    buffer.writeln();

    buffer.writeln('''
  @override
  FormElement getInstance() {
    return ${componentDescription.type.toConstructorString()};
  }''');

    return buffer.toString();
  }

  @override
  String generatePrelude() => "";
}
