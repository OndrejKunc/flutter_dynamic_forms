import 'package:dynamic_forms_generator/src/generator/parser_generator/form_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/value_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';

abstract class ElementParserGenerator {
  late ComponentDescription componentDescription;
  PropertyDescription? contentProperty;

  static const String _valueElementName = 'valueElement';

  String generate();

  static ElementParserGenerator getGenerator({
    String? typeName,
    required ComponentDescription componentDescription,
    PropertyDescription? contentProperty}) {
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
        ..componentDescription = componentDescription
        ..contentProperty = contentProperty;
      return returnElement;
    } else {
      throw "Typename can't be null";
    }
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  String _getPropertyParserMethodName(ComponentType type) => type.isNullable ? 'getNullable${_capitalize(type.typeName)}Property' : 'get${_capitalize(type.typeName)}Property';

  String getParseMethod(PropertyDescription property, bool isContentProperty) {
    if (property.name == 'id') {
      return 'parserNode.getPlainString(\'id\')';
    }
    if (property.name == 'parent') {
      return 'parserNode.getParent(parent)';
    }
    if (property.name == 'isVisible') {
      return 'parserNode.getIsVisible()';
    }
    if (property.type.typeName == 'bool') {
      var defaultValue = property.defaultValue == 'true'
          ? 'ParserNode.defaultTrue'
          : 'ParserNode.defaultFalse';
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',        
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'string') {
      var defaultValue =
          (property.defaultValue == '' || property.defaultValue == null)
              ? 'ParserNode.defaultString'
              : '() => \'${property.defaultValue}\'';

      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type is ArrayType) {
      var arrayType = property.type as ArrayType;
      return '''parserNode.getChildrenProperty<${arrayType.innerType.toTypeString()}>(
          parent: ${componentDescription.type.typeName},
          parser: parser,
          childrenPropertyName: '${property.name}',
          isContentProperty: $isContentProperty)''';
    }
    if (property.type.typeName == 'decimal') {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ''
              ? '0'
              : property.defaultValue;
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: () => Decimal.fromDouble($defaultValue),
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'int') {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ''
              ? '0'
              : property.defaultValue;
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',      
        defaultValue: () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'double') {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ''
              ? '0'
              : property.defaultValue;
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'dateTime') {
      var defaultValue =
          property.defaultValue == null || property.defaultValue == ''
              ? 'null'
              : 'DateTime.parse(\'${property.defaultValue}\')';
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.isEnum) {
      var defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue = 'null';
      } else {
        if (property.defaultValue!.contains('.')) {
          var lastPart = property.defaultValue!.split('.').last;
          defaultValue = '${property.type.toTypeString()}.$lastPart';
        } else {
          defaultValue =
              '${property.type.toTypeString()}.${property.defaultValue}';
        }
      }
      return '''parserNode.getEnumProperty(
        '${property.name}',
        ${property.type.toTypeString()}.values,
        defaultValue: () => $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if ((property.type.typeName.endsWith('valueElement')) ||
        ((property.type.typeName.endsWith('ValueElement')))) {
      return '''parserNode.getChildProperty<${property.type.toTypeString()}>(
          parent: ${componentDescription.type.typeName},
          parser: parser,
          propertyName: '${property.name}',
          isContentProperty: $isContentProperty,
          defaultValue: () => ${property.type.capitalizedTypeName}(),
          isImmutable: ${!property.isMutable})''';
    }

    return '''parserNode.getChildProperty<${property.type.toTypeString()}>(
        propertyName: '${property.name}',
        parent: ${componentDescription.type.typeName},
        parser: parser,
        defaultValue: () => null,
        isContentProperty: $isContentProperty,
        isImmutable: ${!property.isMutable},
      )''';
  }
}
