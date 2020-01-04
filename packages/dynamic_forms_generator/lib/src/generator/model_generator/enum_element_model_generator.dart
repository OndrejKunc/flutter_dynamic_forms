import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class EnumElementModelGenerator extends ElementModelGenerator {
  @override
  String generateBody() {
    var buffer = StringBuffer();
    buffer.writeln(
        '  final ${componentDescription.type.toTypeString()}Enum enumeration;');
    buffer.writeln(
        '  ${componentDescription.type.toTypeString()}({@required this.enumeration});');
    buffer.writeln('''
  @override
  ExpressionProviderElement clone(
          ExpressionProvider<ExpressionProviderElement> parent) =>
      ${componentDescription.type.toTypeString()}(enumeration: enumeration);
      ''');
    buffer.writeln('''
  @override
  ExpressionProvider getExpressionProvider(
          [String propertyName]) =>
      ImmutableProperty(enumeration);''');
    return buffer.toString();
  }

  @override
  String generatePrelude() {
    var buffer = StringBuffer();
    buffer.write('enum ${componentDescription.type.toTypeString()}Enum {');
    for (var property in componentDescription.properties) {
      buffer.write(' ${property.name},');
    }
    buffer.writeln('}');
    buffer.writeln();
    return buffer.toString();
  }
}
