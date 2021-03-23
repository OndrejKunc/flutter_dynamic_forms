import 'package:build/build.dart';
import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/model_generator_factory.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/parser_generator.dart';
import 'package:dynamic_forms_generator/src/parser/parser.dart';

import 'component_description_builder.dart';

class DynamicFormsBuilder implements Builder {
  final Map<String, dynamic> config;
  final ComponentDescriptionBuilder componentDescriptionBuilder;
  final ComponentYamlParser componentYamlParser;

  DynamicFormsBuilder(this.config)
      : componentDescriptionBuilder = ComponentDescriptionBuilder(),
        componentYamlParser = ComponentYamlParser();

  @override
  Future build(BuildStep buildStep) async {
    var buildConfiguration = BuildConfiguration.fromConfig(config);

    var inputId = buildStep.inputId;
    var content = await buildStep.readAsString(inputId);
    if (inputId.path.contains('pubspec.yaml') ||
        inputId.path.contains('build.yaml') ||
        inputId.path.contains('analysis_options.yaml') ||
        buildConfiguration.componentsToIgnore
            .any((c) => inputId.path.contains(c))) {
      return;
    }

    var rawComponentDescription =
        componentYamlParser.parse(content, inputId.path);
    if (rawComponentDescription == null) {
      return;
    }

    var componentDescription = componentDescriptionBuilder
        .buildFromRawComponent(rawComponentDescription);

    var modelGenerator = getGenerator(
      componentDescription: componentDescription,
      typeName: componentDescription.parentType!.typeName,
      buildConfiguration: buildConfiguration,
    );

    var modelContent = modelGenerator.generateBody();

    var model = inputId.changeExtension('.g.dart');
    await buildStep.writeAsString(model, modelContent);

    if (componentDescription.parentType?.typeName == 'enum') {
      return;
    }

    var contentProperty = componentDescription.contentProperty;

    var parserGenerator = ParserGenerator(
      componentDescription: componentDescription,
      buildConfiguration: buildConfiguration,
      contentProperty: contentProperty,
    );

    var parserContent = parserGenerator.generate();
    if (parserContent == null) {
      return;
    }
    var parser = inputId.changeExtension('_parser.g.dart');
    await buildStep.writeAsString(parser, parserContent);
  }

  @override
  final Map<String, List<String>> buildExtensions = const {
    '.yaml': ['.g.dart', '_parser.g.dart']
  };
}
