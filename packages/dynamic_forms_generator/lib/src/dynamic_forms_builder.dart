import 'package:build/build.dart';
import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model_generator.dart';
import 'package:dynamic_forms_generator/src/parser/parser.dart';
import 'package:dynamic_forms_generator/src/parser_generator.dart';
import 'package:glob/glob.dart';

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
    if (inputId.path.contains("pubspec.yaml") ||
        inputId.path.contains("build.yaml") ||
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
    if (componentDescription == null) {
      return;
    }

    List<PropertyDescription> allProperties = componentDescription.properties.toList();
    if (componentDescription.parentType != null) {
      allProperties = await _getParentProperties(
          componentDescription.parentType.typeName, buildStep, allProperties);
    }

    var modelGenerator = ModelGenerator(
        componentDescription: componentDescription,
        buildConfiguration: buildConfiguration);
    var modelContent = modelGenerator.generate();
    if (modelContent == null) {
      return;
    }
    var model = inputId.changeExtension(".g.dart");
    await buildStep.writeAsString(model, modelContent);

    var parserGenerator = ParserGenerator(
        componentDescription: componentDescription,
        buildConfiguration: buildConfiguration);
    var parserContent = parserGenerator.generate();
    if (parserContent == null) {
      return;
    }
    var parser = inputId.changeExtension("_parser.g.dart");
    await buildStep.writeAsString(parser, parserContent);
  }

  @override
  final Map<String, List<String>> buildExtensions = const {
    '.yaml': ['.g.dart', '_parser.g.dart']
  };

  Future<List<PropertyDescription>> _getParentProperties(String typeName,
      BuildStep buildStep, List<PropertyDescription> properties) async {
    var fileName = _getFileNameFromTypeName(typeName);
    var assets = await buildStep.findAssets(Glob("lib/**$fileName")).toList();
    if (assets == null || assets.isEmpty) {
      return properties;
    }
    var asset = assets.first;
    var content = await buildStep.readAsString(asset);

    var rawComponentDescription =
        componentYamlParser.parse(content, asset.path);
    if (rawComponentDescription == null) {
      return properties;
    }

    var componentDescription = componentDescriptionBuilder
        .buildFromRawComponent(rawComponentDescription);
    if (componentDescription == null) {
      return properties;
    }

    properties.addAll(componentDescription.properties);

    if (componentDescription.parentType == null) {
      return properties;
    }
    return _getParentProperties(
        componentDescription.parentType.typeName, buildStep, properties);
  }

  String _getFileNameFromTypeName(String typeName) {
    final beforeCapitalLetter = RegExp(r"(?=[A-Z])");
    var parts = typeName.split(beforeCapitalLetter);
    if (parts.isNotEmpty && parts[0].isEmpty) {
      parts = parts.sublist(1);
    }

    return parts.join("_") + ".yaml";
  }
}
