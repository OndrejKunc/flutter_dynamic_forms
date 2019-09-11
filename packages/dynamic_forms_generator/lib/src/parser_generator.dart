import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

class ParserGenerator {
  final ComponentDescription componentDescription;
  final BuildConfiguration buildConfiguration;

  ParserGenerator({
    @required this.componentDescription,
    @required this.buildConfiguration,
  });

  String generate() {
    return "//TODO";
  }
}
