import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

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
    ElementModelGenerator generator = ElementModelGenerator.getGenerator(
        componentDescription: componentDescription,
        typeName: componentDescription.parentType.typeName);

    buffer.writeln("// GENERATED CODE - DO NOT MODIFY BY HAND");
    buffer.writeln();

    for (var import in [
      ...buildConfiguration.defaultImports,
      ...buildConfiguration.modelImports
    ]) {
      buffer.writeln("import '$import';");
    }

    if (buildConfiguration.defaultImports.isNotEmpty) {
      buffer.writeln();
    }

    buffer.write(generator.generatePrelude());
    buffer.writeln(
        "class ${componentDescription.type.toTypeString()} extends ${componentDescription.parentType.toTypeString()} {");
    buffer.write(generator.generateBody());
    buffer.writeln("}");
    return buffer.toString();
  }
}
