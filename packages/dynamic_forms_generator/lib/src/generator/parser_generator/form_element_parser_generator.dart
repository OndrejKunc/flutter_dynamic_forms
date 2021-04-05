import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';

class FormElementParserGenerator extends ElementParserGenerator {
  @override
  String generate() {
    var isGeneric = componentDescription.type is GenericDefinitionType;
    var classGenericType =
        isGeneric ? componentDescription.type as GenericDefinitionType : null;

    var classPrefix = isGeneric ? 'abstract ' : '';

    var buffer = StringBuffer();
    var endOfClassLine = isGeneric ? '\n        ' : '';
    buffer.write(
        '${classPrefix}class ${componentDescription.type.capitalizedTypeName}Parser<$endOfClassLine');
    buffer.write(
        'T${componentDescription.type.capitalizedTypeName} extends ${componentDescription.type.capitalizedTypeName}');

    if (isGeneric) {
      var classGenericParameters = classGenericType!.genericParameters
          .map((g) => g.capitalizedTypeName)
          .join(', ');
      buffer.write('<$classGenericParameters>');
      var classGenericParametersDefinitions = classGenericType.genericParameters
          .map((g) => g.toTypeString())
          .join(',\n        ');
      buffer.write(',\n        $classGenericParametersDefinitions');
    }

    buffer.writeln('>');

    buffer.write(
        '    extends ${componentDescription.parentType!.capitalizedTypeName}Parser<T${componentDescription.type.capitalizedTypeName}');

    if (componentDescription.parentType is GenericType) {
      var parentGenericType = componentDescription.parentType as GenericType;
      var parentGenericParameters = parentGenericType.genericParameters
          .map((g) => g.toTypeString())
          .join(', ');
      buffer.write(', $parentGenericParameters');
    }

    buffer.writeln('> {');

    if (!isGeneric) {
      buffer.writeln('  @override');
      buffer.writeln(
          '  String get name => \'${componentDescription.type.typeName}\';');
      buffer.writeln();

      buffer.writeln('  @override');
      buffer.writeln(
          '  FormElement getInstance() => ${componentDescription.type.capitalizedTypeName}();');
    }

    buffer.writeln('''

  @override
  void fillProperties(
    T${componentDescription.type.capitalizedTypeName} ${componentDescription.type.typeName}, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {''');

    buffer.writeln('''
    super.fillProperties(${componentDescription.type.typeName}, parserNode, parent, parser);''');

    for (var i = 0; i < componentDescription.properties.length; i++) {
      if (i == 0) {
        buffer.writeln('    ${componentDescription.type.typeName}');
      }
      var property = componentDescription.properties[i];
      var propertySetter =
          property.name == 'id' ? 'id' : '${property.name}Property';
      var parseMethod =
          getParseMethod(property, contentProperty?.name == property.name);
      var endOfLine =
          i == componentDescription.properties.length - 1 ? ';' : '';
      buffer.writeln('      ..$propertySetter = ${parseMethod}$endOfLine');
    }

    buffer.writeln('  }');

    buffer.writeln('}');
    return buffer.toString();
  }
}
