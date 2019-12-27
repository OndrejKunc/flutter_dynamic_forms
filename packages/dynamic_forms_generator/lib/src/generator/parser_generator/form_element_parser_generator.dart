import 'package:dynamic_forms_generator/src/generator/parser_generator/element_parser_generator.dart';

class FormElementParserGenerator extends ElementParserGenerator {
  @override
  String generate() {
    StringBuffer buffer = StringBuffer();
    buffer.writeln(
        "class ${componentDescription.type.capitalizedTypeName}Parser<T${componentDescription.type.capitalizedTypeName} extends ${componentDescription.type.capitalizedTypeName}> extends ${componentDescription.parentType.capitalizedTypeName}Parser<T${componentDescription.type.capitalizedTypeName}> {");
    buffer.writeln("  @override");
    buffer.writeln(
        "  String get name => \"${componentDescription.type.typeName}\";");
    buffer.writeln();

    buffer.writeln("  @override");
    buffer.writeln(
        "  FormElement getInstance() => ${componentDescription.type.capitalizedTypeName}();");

    buffer.writeln('''

  @override
  void fillProperties(
    T${componentDescription.type.capitalizedTypeName} ${componentDescription.type.typeName}, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser) {''');

    buffer.writeln('''
    super.fillProperties(${componentDescription.type.typeName}, parserNode, parent, parser);''');

    for (var i = 0; i < componentDescription.properties.length; i++) {
      if (i == 0) {
        buffer.writeln("    ${componentDescription.type.typeName}");
      }
      var property = componentDescription.properties[i];
      var propertySetter =
          property.name == "id" ? "id" : "${property.name}Property";
      var parseMethod =
          getParseMethod(property, contentProperty?.name == property?.name);
      var endOfLine =
          i == componentDescription.properties.length - 1 ? ";" : "";
      buffer.writeln("      ..$propertySetter = ${parseMethod}$endOfLine");
    }

    buffer.writeln("  }");

    buffer.writeln("}");
    return buffer.toString();
  }
}
