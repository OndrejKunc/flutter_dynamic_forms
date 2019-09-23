import 'package:dynamic_forms_generator/src/generator/model_generator/enum_element_model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/form_element_model_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:expression_language/expression_language.dart';

import 'value_element_model_generator.dart';

abstract class ElementModelGenerator {
  ComponentDescription componentDescription;
  List<PropertyDescription> allProperties;

  static const String _enumElementName = "enumElement";
  static const String _valueElementName = "valueElement";

  String generatePrelude();
  String generateBody();

  dynamic getDefaultValue(String type) {
    switch (type) {
      case "bool":
        {
          return false;
        }
      case "string":
        {
          return "";
        }
      case "decimal":
        {
          return Decimal.fromInt(0);
        }
      case "int":
        {
          return 0;
        }
      case "double":
        {
          return 0.0;
        }
      case "dateTime":
        {
          return DateTime.now();
        }
      default:
        {
          return null;
        }
    }
  }

  static ElementModelGenerator getGenerator({
    String typeName,
    ComponentDescription componentDescription,
    List<PropertyDescription> allProperties,
  }) {
    ElementModelGenerator returnElement;
    if (typeName != null) {
      switch (typeName) {
        case _enumElementName:
          {
            returnElement = EnumElementModelGenerator();
            break;
          }
        case _valueElementName:
          {
            returnElement = ValueElementModelGenerator();
            break;
          }
        default:
          {
            returnElement = FormElementModelGenerator();
            break;
          }
      }
      returnElement
        ..allProperties = allProperties
        ..componentDescription = componentDescription;

      return returnElement;
    } else {
      throw "Typename can't be null";
    }
  }
}
