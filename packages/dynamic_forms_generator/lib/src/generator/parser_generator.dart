import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:meta/meta.dart';

class ParserGenerator {
  final ComponentDescription componentDescription;
  final BuildConfiguration buildConfiguration;
  final List<PropertyDescription> allProperties;
  final PropertyDescription contentProperty;

  ParserGenerator({
    @required this.componentDescription,
    @required this.buildConfiguration,
    @required this.allProperties,
    @required this.contentProperty,
  });

  String generate() {
    StringBuffer buffer = StringBuffer();

    buffer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
    buffer.writeln();

    for (var import in [
      ...buildConfiguration.defaultImports,
      ...buildConfiguration.parserImports
    ]) {
      buffer.writeln("import '$import';");
    }

    if (buildConfiguration.defaultImports.length > 0) {
      buffer.writeln();
    }

    buffer.writeln(
        "class ${componentDescription.type.capitalizedTypeName}Parser extends FormElementParser<${componentDescription.type.toTypeString()}> {");

    buffer.writeln("  @override");
    buffer.writeln(
        "  String get name => \"${componentDescription.type.typeName}\";");

    buffer.writeln('''

  @override
  ${componentDescription.type.toTypeString()} parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {''');

    buffer.writeln('''
    var ${componentDescription.type.typeName} = ${componentDescription.type.capitalizedTypeName}();
    ${componentDescription.type.typeName}.fill${componentDescription.type.capitalizedTypeName}(''');

    for (var property in allProperties) {
      var parseMethod = _getParseMethod(
          property, contentProperty?.name == property?.name);
      buffer.writeln("      ${property.name}: ${parseMethod},");
    }

    buffer.writeln("    );");
    buffer.writeln("    return ${componentDescription.type.typeName};");

    buffer.writeln("  }");

    buffer.writeln("}");
    return buffer.toString();
  }

  String _getParseMethod(PropertyDescription property, bool isContentProperty) {
    if (property.name == "id") {
      return "parserNode.getPlainStringValue(\"id\")";
    }
    if (property.name == "parent") {
      return "parserNode.getParentValue(parent)";
    }
    if (property.name == "isVisible") {
      return "parserNode.getIsVisible()";
    }
    if (property.type.typeName == "bool") {
      String defaultValue = property.defaultValue == "true"
          ? "ParserNode.defaultTrue"
          : "ParserNode.defaultFalse";
      return '''parserNode.getValue(
        "${property.name}",
        ParserNode.convertToBool,
        $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "string") {
      return '''parserNode.getStringValue(
        "${property.name}",
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type is ArrayType) {
      var arrayType = property.type as ArrayType;
      return '''parserNode.getChildren<${arrayType.innerType.toTypeString()}>(
        parent: ${componentDescription.type.typeName},
        parser: parser,
        childrenPropertyName: "${property.name}",
        isContentProperty: $isContentProperty)''';
    }
    if (property.type.typeName == "decimal") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<Decimal>(
        "${property.name}",
        (s) => Decimal.parse(s),
        () => Decimal.fromDouble($defaultValue),
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "int") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<int>(
        "${property.name}",
        (s) => int.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "double") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<double>(
        "${property.name}",
        (s) => double.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "dateTime") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "null"
              : "DateTime.parse(\"${property.defaultValue}\")";
      return '''parserNode.getValue<DateTime>(
        "${property.name}",
        (s) => DateTime.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    return '''parserNode.getChild<${property.type.toTypeString()}>(
        parent: ${componentDescription.type.typeName},
        parser: parser,
        name: "${property.name}",
        childName: "${property.type.typeName}",
        isContentProperty: $isContentProperty,
        defaultValue: () => ${property.type.capitalizedTypeName}(),
        isImmutable: ${!property.isMutable})''';
  }
}
