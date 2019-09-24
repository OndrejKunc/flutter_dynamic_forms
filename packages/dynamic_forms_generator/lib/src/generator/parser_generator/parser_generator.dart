import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
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

  List forbiddenTypes = ["enumElement"];

  bool _generateParser() =>
      !forbiddenTypes.contains(componentDescription.parentType.typeName);

  String generate() {
    if (!_generateParser()) {
      return null;
    }
    StringBuffer buffer = StringBuffer();
    ElementParserGenerator generator = ElementParserGenerator.getGenerator(
      typeName: componentDescription.parentType.typeName,
      contentProperty: contentProperty,
      componentDescription: componentDescription,
      allProperties: allProperties,
    );

    buffer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
    buffer.writeln();

    for (var import in [
      ...buildConfiguration.defaultImports,
      ...buildConfiguration.parserImports
    ]) {
      buffer.writeln("import '$import';");
    }

    if (buildConfiguration.defaultImports.isNotEmpty) {
      buffer.writeln();
    }

    buffer.writeln(
        "class ${componentDescription.type.capitalizedTypeName}Parser extends ElementParser<${componentDescription.type.toTypeString()}> {");

    buffer.write(generator.generate());

    buffer.writeln("}");
    return buffer.toString();
  }
}
