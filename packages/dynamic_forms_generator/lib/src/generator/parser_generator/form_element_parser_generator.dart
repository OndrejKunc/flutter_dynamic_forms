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
    ${componentDescription.type.typeName}''');

    for (var i = 0; i < allProperties.length; i++) {
      var property = allProperties[i];
      var propertySetter =
          property.name == "id" ? "id" : "${property.name}Property";
      var parseMethod =
          getParseMethod(property, contentProperty?.name == property?.name);
      var endOfLine = i == allProperties.length - 1 ? ";" : "";
      buffer.writeln("      ..$propertySetter = ${parseMethod}$endOfLine");
    }

    buffer.writeln("    return ${componentDescription.type.typeName};");

    buffer.writeln("  }");

    return buffer.toString();
  }
}
