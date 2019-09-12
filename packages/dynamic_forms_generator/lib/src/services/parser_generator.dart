import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

class ParserGenerator {
  final ComponentDescription componentDescription;
  final BuildConfiguration buildConfiguration;
  final List<PropertyDescription> allProperties;

  ParserGenerator({
    @required this.componentDescription,
    @required this.buildConfiguration,
    @required this.allProperties,
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

    buffer.writeln("    );");
    buffer.writeln("    return ${componentDescription.type.typeName};");

    buffer.writeln("  }");

    buffer.writeln("}");
    return buffer.toString();
  }
}
