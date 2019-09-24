import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';

class FormElementParserGenerator extends ElementParserGenerator {
  @override
  String generate() {
    StringBuffer buffer = StringBuffer();
    buffer.writeln("  @override");
    buffer.writeln(
        "  String get name => \"${componentDescription.type.typeName}\";");

    buffer.writeln('''

  @override
  ${componentDescription.type.toTypeString()} parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {''');

    buffer.writeln('''
    var ${componentDescription.type.typeName} = ${componentDescription.type.capitalizedTypeName}();
    ${componentDescription.type.typeName}.fill${componentDescription.type.capitalizedTypeName}(''');

    for (var property in allProperties) {
      var parseMethod =
          getParseMethod(property, contentProperty?.name == property?.name);
      buffer.writeln("      ${property.name}: ${parseMethod},");
    }

    buffer.writeln("    );");
    buffer.writeln("    return ${componentDescription.type.typeName};");

    buffer.writeln("  }");

    return buffer.toString();
  }
}
