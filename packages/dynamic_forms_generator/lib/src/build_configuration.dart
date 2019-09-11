class BuildConfiguration {
  final List<String> defaultImports;

  BuildConfiguration({this.defaultImports = const []});

  factory BuildConfiguration.fromConfig(Map<String, dynamic> config) {
    List<String> namespaces = [];
    if (config.containsKey("default_imports")) {
      namespaces = config["default_imports"];
    }
    return BuildConfiguration(defaultImports: namespaces);
  }
}
