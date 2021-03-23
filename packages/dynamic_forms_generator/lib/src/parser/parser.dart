import 'package:dynamic_forms_generator/src/model/raw_component_description.dart';
import 'package:yaml/yaml.dart';

class ComponentYamlParser {
  RawComponentDescription? parse(String content, String inputPath) {
    YamlMap parsedMap;

    try {
      parsedMap = loadYaml(content);
    } catch (e) {
      print('Error parsing ${inputPath}: $e');
      return null;
    }

    try {
      YamlMap? propertyMap = parsedMap['properties'];
      var properties = <RawPropertyDescription>[];
      if (propertyMap != null) {
        for (var propertyEntry in propertyMap.entries) {
          YamlMap propertyAttributtes = propertyEntry.value;
          properties.add(
            RawPropertyDescription(
              name: propertyEntry.key,
              type: propertyAttributtes['type'],
              defaultValue: propertyAttributtes['default']?.toString(),
              isMutable: propertyAttributtes['isMutable'] == 'true' ||
                  propertyAttributtes['isMutable'] == true,
              isEnum: propertyAttributtes['isEnum'] == 'true' ||
                  propertyAttributtes['isEnum'] == true,
            ),
          );
        }
      }

      YamlList? yamlList = parsedMap['values'];
      var values = <String>[];
      if (yamlList != null) {
        for (var value in yamlList) {
          values.add(value);
        }
      }

      properties.sort((p1, p2) => p1.name.compareTo(p2.name));
      var result = RawComponentDescription(
        type: parsedMap['type'],
        parentType: parsedMap['parentType'],
        contentProperty: parsedMap['contentProperty'],
        properties: properties,
        values: values,
      );

      return result;
    } catch (e, stackTrace) {
      print(
          'Error parsing ${inputPath} into the component description: $e $stackTrace');
      return null;
    }
  }
}
