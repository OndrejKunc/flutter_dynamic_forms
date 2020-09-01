import 'package:yaml/yaml.dart';

class BuildConfiguration {
  final List<String> defaultImports;
  final List<String> modelImports;
  final List<String> formElementModelImports;
  final List<String> enumElementImports;
  final List<String> valueElementModelImports;
  final List<String> parserImports;
  final List<String> comments;
  final List<String> componentsToIgnore;
  final bool stronglyCastProperties;

  BuildConfiguration({
    this.defaultImports = const [],
    this.comments = const [],
    this.modelImports = const [],
    this.formElementModelImports = const [],
    this.enumElementImports = const [],
    this.valueElementModelImports = const [],
    this.parserImports = const [],
    this.componentsToIgnore = const [],
    this.stronglyCastProperties = false,
  });

  factory BuildConfiguration.fromConfig(Map<String, dynamic> config) {
    var defaultImports = <String>[];
    if (config.containsKey('default_imports')) {
      defaultImports = _getConfigList(config, 'default_imports');
    }
    var modelImports = <String>[];
    if (config.containsKey('model_imports')) {
      modelImports = _getConfigList(config, 'model_imports');
    }
    var formElementModelImports = <String>[];
    if (config.containsKey('form_element_model_imports')) {
      formElementModelImports =
          _getConfigList(config, 'form_element_model_imports');
    }
    var enumElementModelImports = <String>[];
    if (config.containsKey('enum_element_model_imports')) {
      enumElementModelImports =
          _getConfigList(config, 'enum_element_model_imports');
    }
    var valueElementModelImports = <String>[];
    if (config.containsKey('value_element_model_imports')) {
      valueElementModelImports =
          _getConfigList(config, 'value_element_model_imports');
    }
    var parserImports = <String>[];
    if (config.containsKey('parser_imports')) {
      parserImports = _getConfigList(config, 'parser_imports');
    }
    var componentsToIgnore = <String>[];
    if (config.containsKey('components_to_ignore')) {
      componentsToIgnore = _getConfigList(config, 'components_to_ignore');
    }
    var comments = <String>[];
    if (config.containsKey('comments')) {
      comments = _getConfigList(config, 'comments');
    }
    var stronglyCastProperties = false;
    if (config.containsKey('strongly_cast_properties')) {
      stronglyCastProperties = config['strongly_cast_properties'] as bool;
    }
    return BuildConfiguration(
      defaultImports: defaultImports,
      modelImports: modelImports,
      formElementModelImports: formElementModelImports,
      enumElementImports: enumElementModelImports,
      valueElementModelImports: valueElementModelImports,
      parserImports: parserImports,
      componentsToIgnore: componentsToIgnore,
      comments: comments,
      stronglyCastProperties: stronglyCastProperties,
    );
  }

  static List<String> _getConfigList(Map<String, dynamic> config, String key) {
    dynamic resultList = config[key];
    if (resultList is YamlList) {
      var list = resultList.toList();
      return List<String>.from(list);
    }
    return List<String>.from((resultList) as List<dynamic>);
  }
}
