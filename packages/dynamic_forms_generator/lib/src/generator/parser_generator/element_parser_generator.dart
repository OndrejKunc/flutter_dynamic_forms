import 'package:dynamic_forms_generator/src/generator/parser_generator/form_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/value_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';

abstract class ElementParserGenerator {
  ComponentDescription componentDescription;
  List<PropertyDescription> allProperties;
  PropertyDescription contentProperty;

  static const String _valueElementName = "valueElement";

  String generate();

  static ElementParserGenerator getGenerator(
      {String typeName,
      ComponentDescription componentDescription,
      List<PropertyDescription> allProperties,
      PropertyDescription contentProperty}) {
    ElementParserGenerator returnElement;
    if (typeName != null) {
      switch (typeName) {
        case _valueElementName:
          {
            returnElement = ValueElementParserGenerator();
            break;
          }
        default:
          {
            returnElement = FormElementParserGenerator();
            break;
          }
      }
      returnElement
        ..allProperties = allProperties
        ..componentDescription = componentDescription
        ..contentProperty = contentProperty;
      return returnElement;
    } else {
      throw "Typename can't be null";
    }
  }

  String getParseMethod(PropertyDescription property, bool isContentProperty) {
    if (property.name == "id") {
      return "parserNode.getPlainStringValue(\"id\")";
    }
    if (property.name == "parent") {
      return "parserNode.getParentValue(parent)";
    }
    if (property.name == "isVisible") {
      return "parserNode.getIsVisible()";
    }
    if (property.type.typeName == "bool") {
      String defaultValue = property.defaultValue == "true"
          ? "ParserNode.defaultTrue"
          : "ParserNode.defaultFalse";
      return '''parserNode.getValue(
        "${property.name}",
        ParserNode.convertToBool,
        $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "string") {
      if (property.defaultValue == null || property.defaultValue == "") {
        return '''parserNode.getStringValue(
        "${property.name}",
        isImmutable: ${!property.isMutable},
      )''';
      }
      return '''parserNode.getValue<String>(
        "${property.name}",
        (s) => s,
        () => "${property.defaultValue}",
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type is ArrayType) {
      var arrayType = property.type as ArrayType;
      return '''parserNode.getChildren<${arrayType.innerType.toTypeString()}>(
          parent: ${componentDescription.type.typeName},
          parser: parser,
          childrenPropertyName: "${property.name}",
          isContentProperty: $isContentProperty)''';
    }
    if (property.type.typeName == "decimal") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<Decimal>(
        "${property.name}",
        (s) => Decimal.parse(s),
        () => Decimal.fromDouble($defaultValue),
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "int") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<int>(
        "${property.name}",
        (s) => int.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "double") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "0"
              : property.defaultValue;
      return '''parserNode.getValue<double>(
        "${property.name}",
        (s) => double.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == "dateTime") {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ""
              ? "null"
              : "DateTime.parse(\"${property.defaultValue}\")";
      return '''parserNode.getValue<DateTime>(
        "${property.name}",
        (s) => DateTime.parse(s),
        () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if ((property.type.typeName.endsWith("valueElement")) ||
        ((property.type.typeName.endsWith("ValueElement")))) {
      return '''parserNode.getChild<${property.type.toTypeString()}>(
          parent: ${componentDescription.type.typeName},
          parser: parser,
          name: "${property.name}",
          childName: "${property.type.typeName}",
          isContentProperty: $isContentProperty,
          defaultValue: () => ${property.type.capitalizedTypeName}(),
          isImmutable: ${!property.isMutable})''';
    }
    if ((property.type.typeName.endsWith("enumElement")) ||
        ((property.type.typeName.endsWith("EnumElement")))) {
      return '''parserNode.getEnum<${property.type.toTypeString()}Enum,${property.type.toTypeString()}>(
          name: "${property.name}",
          enumerationValues: ${property.type.toTypeString()}Enum.values,
          enumElementConstructor: (x) => ${property.type.toTypeString()}(enumeration: x))
          ''';
    }
    throw "Unknown property type : ${componentDescription.type.typeName}";
  }
}
