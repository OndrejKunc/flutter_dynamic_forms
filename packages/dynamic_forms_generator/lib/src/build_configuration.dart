class BuildConfiguration {
  final List<String> defaultImports;
  final List<String> componentsToIgnore;

  BuildConfiguration({
    this.defaultImports = const [],
    this.componentsToIgnore = const [],
  });

  factory BuildConfiguration.fromConfig(Map<String, dynamic> config) {
    List<String> imports = [];
    if (config.containsKey("default_imports")) {
      imports = config["default_imports"];
    }
    List<String> componentsToIgnore = [];
    if (config.containsKey("components_to_ignore")) {
      componentsToIgnore = config["components_to_ignore"];
    }
    return BuildConfiguration(
      defaultImports: imports,
      componentsToIgnore: componentsToIgnore,
    );
  }
}
