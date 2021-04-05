import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';

class ParserGenerator {
  final ComponentDescription componentDescription;
  final BuildConfiguration buildConfiguration;
  final PropertyDescription? contentProperty;

  ParserGenerator({
    required this.componentDescription,
    required this.buildConfiguration,
    this.contentProperty,
  });

  List forbiddenTypes = ['enumElement'];

  bool _generateParser() => componentDescription.parentType == null
      ? false
      : !forbiddenTypes.contains(componentDescription.parentType!.typeName);

  String? generate() {
    if (!_generateParser()) {
      return null;
    }
    var buffer = StringBuffer();
    var generator = ElementParserGenerator.getGenerator(
      typeName: componentDescription.parentType?.typeName,
      contentProperty: contentProperty,
      componentDescription: componentDescription,
    );

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln();

    for (var comment in buildConfiguration.comments) {
      buffer.writeln('//$comment');
    }

    for (var import in [
      ...buildConfiguration.defaultImports,
      ...buildConfiguration.parserImports
    ]) {
      buffer.writeln("import '$import';");
    }

    if (buildConfiguration.defaultImports.isNotEmpty) {
      buffer.writeln();
    }

    buffer.write(generator.generate());

    return buffer.toString();
  }
}
