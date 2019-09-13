import 'package:build/build.dart';
import 'package:dynamic_forms_generator/dynamic_forms_generator.dart';

Builder dynamicFormsBuilder(BuilderOptions options) =>
    DynamicFormsBuilder(options.config);
