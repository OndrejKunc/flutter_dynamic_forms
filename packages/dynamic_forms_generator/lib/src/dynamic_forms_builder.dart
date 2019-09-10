import 'package:build/build.dart';
import 'package:dynamic_forms_generator/src/model_generator.dart';
import 'package:dynamic_forms_generator/src/parser.dart';
import 'package:dynamic_forms_generator/src/parser_generator.dart';

import 'component_description_builder.dart';

class DynamicFormsBuilder implements Builder {
  final Map<String, dynamic> config;

  DynamicFormsBuilder(this.config);

  @override
  Future build(BuildStep buildStep) async {
    print("This is the config: $config");
    var inputId = buildStep.inputId;
    var content = await buildStep.readAsString(inputId);
    if (inputId.path.contains("pubspec.yaml") ||
        inputId.path.contains("build.yaml")) {
      return;
    }

    var rawComponentDescription = parseFromYaml(content, inputId.path);
    if (rawComponentDescription == null) {
      return;
    }
    var componentDescription = buildFromRawComponent(rawComponentDescription);
    if (componentDescription == null) {
      return;
    }

    var modelGenerator = ModelGenerator(componentDescription);
    var modelContent = modelGenerator.generate();
    if (modelContent == null){
      return;
    }
    var model = inputId.changeExtension(".g.dart");
    await buildStep.writeAsString(model, modelContent);

    var parserGenerator = ParserGenerator(componentDescription);
    var parserContent = parserGenerator.generate();
    if (parserContent == null){
      return;
    }
    var parser = inputId.changeExtension("_parser.g.dart");
    await buildStep.writeAsString(parser, parserContent);
  }

  @override
  final Map<String, List<String>> buildExtensions = const {
    '.yaml': ['.g.dart', '_parser.g.dart']
  };
}
