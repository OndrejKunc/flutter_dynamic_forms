import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';

class EnumModelGenerator extends ElementModelGenerator {
  @override
  String generateBody() {
    var buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln();

    buffer.writeln('enum ${componentDescription.type.toTypeString()} {');

    for (var enumValue in componentDescription.values) {
      buffer.writeln('  $enumValue,');
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}
