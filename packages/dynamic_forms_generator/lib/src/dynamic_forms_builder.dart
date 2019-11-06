import 'package:build/build.dart';
import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/parser/parser.dart';
import 'package:dynamic_forms_generator/src/services/inheritance_service.dart';
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

    List<ComponentDescription> inheritanceList = [componentDescription];
    if (componentDescription.parentType != null) {
      inheritanceList = await _getInheritanceList(
          componentDescription.parentType.typeName, buildStep, inheritanceList);
    }

    var inheritanceService = InheritanceService(inheritanceList);
    inheritanceService.resolveGenericTypes();
    var allProperties = inheritanceService.getAllProperties();

    var modelGenerator = ModelGenerator(
        componentDescription: componentDescription,
        buildConfiguration: buildConfiguration,
        allProperties: allProperties);
    var modelContent = modelGenerator.generate();
    if (modelContent == null) {
      return;
    }
    var model = inputId.changeExtension(".g.dart");
    await buildStep.writeAsString(model, modelContent);

    if (componentDescription.type is GenericDefinitionType) {
      //We don't support parsers for generic types
      return;
    }

    var contentProperty = inheritanceService.getContentProperty();

    var parserGenerator = ParserGenerator(
      componentDescription: componentDescription,
      buildConfiguration: buildConfiguration,
      allProperties: allProperties,
      contentProperty: contentProperty,
    );

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

  Future<List<ComponentDescription>> _getInheritanceList(String typeName,
      BuildStep buildStep, List<ComponentDescription> list) async {
    var fileName = _getFileNameFromTypeName(typeName);
    var assets = await buildStep.findAssets(Glob("lib/**/$fileName")).toList();
    if (assets == null || assets.isEmpty) {
      return list;
    }
    var asset = assets.first;
    var content = await buildStep.readAsString(asset);

    var rawComponentDescription =
        componentYamlParser.parse(content, asset.path);
    if (rawComponentDescription == null) {
      return list;
    }

    var componentDescription = componentDescriptionBuilder
        .buildFromRawComponent(rawComponentDescription);
    if (componentDescription == null) {
      return list;
    }

    list.insert(0, componentDescription);

    if (componentDescription.parentType == null) {
      return list;
    }
    return _getInheritanceList(
        componentDescription.parentType.typeName, buildStep, list);
  }

  String _getFileNameFromTypeName(String typeName) {
    final beforeCapitalLetter = RegExp(r"(?=[A-Z])");
    var parts = typeName.split(beforeCapitalLetter);
    if (parts.isNotEmpty && parts[0].isEmpty) {
      parts = parts.sublist(1);
    }

    return parts.map((p) => p.toLowerCase()).join("_") + ".yaml";
  }
}
