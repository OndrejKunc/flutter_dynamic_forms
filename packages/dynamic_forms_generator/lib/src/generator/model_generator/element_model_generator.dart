import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/enum_element_model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/form_element_model_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

import 'value_element_model_generator.dart';

abstract class ElementModelGenerator {
  ComponentDescription componentDescription;
  List<String> imports;

  static const String _enumElementName = 'enumElement';
  static const String _valueElementName = 'valueElement';

  String generatePrelude();
  String generateBody();

  String getDefaultValue(String type) {
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

  static ElementModelGenerator getGenerator({
    @required String typeName,
    @required ComponentDescription componentDescription,
    @required BuildConfiguration buildConfiguration,
  }) {
    ElementModelGenerator returnElement;
    if (typeName != null) {
      switch (typeName) {
        case _enumElementName:
          {
            returnElement = EnumElementModelGenerator();
            returnElement.imports = [
              ...buildConfiguration.defaultImports,
              ...buildConfiguration.modelImports,
              ...buildConfiguration.enumElementImports
            ];
            break;
          }
        case _valueElementName:
          {
            returnElement = ValueElementModelGenerator();
            returnElement.imports = [
              ...buildConfiguration.defaultImports,
              ...buildConfiguration.modelImports,
              ...buildConfiguration.valueElementModelImports
            ];
            break;
          }
        default:
          {
            returnElement = FormElementModelGenerator();
            returnElement.imports = [
              ...buildConfiguration.defaultImports,
              ...buildConfiguration.modelImports,
              ...buildConfiguration.formElementModelImports
            ];
            break;
          }
      }
      returnElement.componentDescription = componentDescription;

      return returnElement;
    } else {
      throw "Typename can't be null";
    }
  }
}
