class BuildConfiguration {
  final List<String> defaultImports;
  final List<String> modelImports;
  final List<String> parserImports;
  final List<String> componentsToIgnore;

  BuildConfiguration({
    this.defaultImports = const [],
    this.modelImports = const [],
    this.parserImports = const [],
    this.componentsToIgnore = const [],
  });

  factory BuildConfiguration.fromConfig(Map<String, dynamic> config) {
    List<String> defaultImports = [];
    if (config.containsKey("default_imports")) {
      defaultImports = config["default_imports"];
    }
    List<String> modelImports = [];
    if (config.containsKey("model_imports")) {
      modelImports = config["model_imports"];
    }
    List<String> parserImports = [];
    if (config.containsKey("parser_imports")) {
      parserImports = config["parser_imports"];
    }
    List<String> componentsToIgnore = [];
    if (config.containsKey("components_to_ignore")) {
      componentsToIgnore = config["components_to_ignore"];
    }
    return BuildConfiguration(
      defaultImports: defaultImports,
      modelImports: modelImports,
      parserImports: parserImports,
      componentsToIgnore: componentsToIgnore,
    );
  }
}
