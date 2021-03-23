import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

abstract class ElementModelGenerator {
  late ComponentDescription componentDescription;
  late List<String> imports;
  late List<String> comments;
  late bool stronglyCastProperties;

  String generateBody();

  @protected
  String? getDefaultValue(String type) {
    switch (type) {
      case 'bool':
        {
          return 'false';
        }
      case 'string':
        {
          return '\'\'';
        }
      case 'int':
        {
          return '0';
        }
      case 'double':
        {
          return '0';
        }
      default:
        {
          return null;
        }
    }
  }
}
