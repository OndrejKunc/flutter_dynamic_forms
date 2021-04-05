import 'package:dynamic_forms_generator/src/generator/parser_generator/form_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/generator/parser_generator/value_element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';

abstract class ElementParserGenerator {
  late ComponentDescription componentDescription;
  PropertyDescription? contentProperty;

  static const String _valueElementName = 'valueElement';

  String generate();

  static ElementParserGenerator getGenerator(
      {String? typeName,
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

  String _getPropertyParserMethodName(ComponentType type) {
    return type.isNullable
        ? 'getNullable${_capitalize(type.typeName)}Property'
        : 'get${_capitalize(type.typeName)}Property';
  }

  String _getDefaultValue(String nonNullableDefaultValue, ComponentType type) {
    return type.isNullable ? '() => null' : nonNullableDefaultValue;
  }

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
      String defaultValue;
      if (property.defaultValue == 'true') {
        defaultValue = 'ParserNode.defaultTrue';
      } else if (property.defaultValue == 'false') {
        defaultValue = 'ParserNode.defaultFalse';
      } else {
        defaultValue =
            _getDefaultValue('ParserNode.defaultFalse', property.type);
      }
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',        
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'string') {
      String defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue =
            _getDefaultValue('ParserNode.defaultString', property.type);
      } else {
        defaultValue = '() => \'${property.defaultValue}\'';
      }
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
      String defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue =
            _getDefaultValue('ParserNode.defaultDecimal', property.type);
      } else {
        defaultValue = '() => Decimal.fromDouble(${property.defaultValue})';
      }
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'int') {
      String defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue = _getDefaultValue('ParserNode.defaultInt', property.type);
      } else {
        defaultValue = '() => ${property.defaultValue}';
      }

      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',      
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'double') {
      String defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue =
            _getDefaultValue('ParserNode.defaultDouble', property.type);
      } else {
        defaultValue = '() => ${property.defaultValue}';
      }
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.type.typeName == 'dateTime') {
      String defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue =
            _getDefaultValue('ParserNode.defaultDateTime', property.type);
      } else {
        defaultValue = '() => DateTime.parse(\'${property.defaultValue}\')';
      }
      return '''parserNode.${_getPropertyParserMethodName(property.type)}(
        '${property.name}',
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if (property.isEnum) {
      var defaultValue;
      if (property.defaultValue == null || property.defaultValue == '') {
        defaultValue = _getDefaultValue(
            '() => ${property.type.toTypeString()}.unknownDefaultValue',
            property.type);
      } else {
        if (property.defaultValue!.contains('.')) {
          var lastPart = property.defaultValue!.split('.').last;
          defaultValue = '() => ${property.type.toTypeString()}.$lastPart';
        } else {
          defaultValue =
              '() => ${property.type.toTypeString()}.${property.defaultValue}';
        }
      }
      return '''parserNode.getEnumProperty(
        '${property.name}',
        ${property.type.toTypeString()}.values,
        defaultValue: $defaultValue,
        isImmutable: ${!property.isMutable},
      )''';
    }
    if ((property.type.typeName.endsWith('valueElement')) ||
        ((property.type.typeName.endsWith('ValueElement')))) {
      var defaultValue = _getDefaultValue(
          '() => ${property.type.capitalizedTypeName}()', property.type);
      return '''parserNode.getChildProperty<${property.type.toTypeString()}>(
          parent: ${componentDescription.type.typeName},
          parser: parser,
          propertyName: '${property.name}',
          isContentProperty: $isContentProperty,
          defaultValue: $defaultValue,
          isImmutable: ${!property.isMutable})''';
    }

    var defaultValue = _getDefaultValue(
        '() => ${property.type.capitalizedTypeName}()', property.type);
    return '''parserNode.getChildProperty<${property.type.toTypeString()}>(
        propertyName: '${property.name}',
        parent: ${componentDescription.type.typeName},
        parser: parser,
        defaultValue: $defaultValue,
        isContentProperty: $isContentProperty,
        isImmutable: ${!property.isMutable},
      )''';
  }
}
