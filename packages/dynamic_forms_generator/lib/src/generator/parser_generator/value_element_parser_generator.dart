import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';

class ValueElementParserGenerator extends ElementParserGenerator {
  @override
  String generate() {
    StringBuffer buffer = StringBuffer();
    buffer.writeln("  @override");
    buffer.writeln(
        "  String get name => \"${componentDescription.type.typeName}\";");
    buffer.writeln('''

  @override
  ${componentDescription.type.toTypeString()} parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) =>''');
    buffer.writeln("      ${componentDescription.type.toTypeString()}( ");
    for (var property in allProperties) {
      var parseMethod =
          getParseMethod(property, contentProperty?.name == property?.name);
      buffer.writeln("      ${property.name}: ${parseMethod}.value,");
    }
    buffer.writeln("    );");
    return buffer.toString();
  }
}
