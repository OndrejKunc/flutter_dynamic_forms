import 'package:dynamic_forms_generator/src/build_configuration.dart';
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

    for (var import in buildConfiguration.defaultImports) {
      buffer.writeln("import '$import';");
    }

    buffer.writeln('''
class ${componentDescription.type.toTypeString()} {
    
}
''');
    return buffer.toString();
  }
}
