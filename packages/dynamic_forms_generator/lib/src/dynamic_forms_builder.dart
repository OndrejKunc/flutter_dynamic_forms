import 'package:build/build.dart';

class DynamicFormsBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var contents = await buildStep.readAsString(inputId);
    if (inputId.path.contains("pubspec.yaml") ||
        inputId.path.contains("build.yaml")) {
      return;
    }

    var parser = inputId.changeExtension('_parser.g.dart');
    var model = inputId.changeExtension('.g.dart');

    await buildStep.writeAsString(parser, '// Copied from to parser $inputId\n$contents');
    await buildStep.writeAsString(model, '// Copied from to model $inputId\n$contents');
  }

  @override
  final Map<String, List<String>> buildExtensions = const {
    '.yaml': ['.g.dart', '_parser.g.dart']
  };
}
