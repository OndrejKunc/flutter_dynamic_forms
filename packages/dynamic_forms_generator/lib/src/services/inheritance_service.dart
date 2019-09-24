import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/visitor/replace_generic_type_visitor.dart';

class InheritanceService {
  final List<ComponentDescription> inheritanceList;

  InheritanceService(this.inheritanceList);

  List<PropertyDescription> getAllProperties() {
    List<PropertyDescription> result = [];
    for (var component in inheritanceList) {
      if (component.type.typeName == "formElement" &&
          component.properties.isNotEmpty) {
        component.properties.insert(
          1,
          PropertyDescription(
            name: "parent",
            type: ComponentType("FormElement"),
            isMutable: false,
          ),
        );
      }
      result.addAll(component.properties);
    }
    return result;
  }

  PropertyDescription getContentProperty() {
    for (var i = inheritanceList.length - 1; i >= 0; i--) {
      if (inheritanceList[i].contentProperty != null) {
        return inheritanceList[i].contentProperty;
      }
    }
    return null;
  }

  void resolveGenericTypes() {
    ComponentDescription lastComponent;
    List<ComponentDescription> parentComponents = [];
    for (var component in inheritanceList) {
      if (lastComponent == null) {
        parentComponents.add(component);
        lastComponent = component;
        continue;
      }
      if (component.parentType is! GenericType) {
        parentComponents.add(component);
        lastComponent = component;
        continue;
      }
      var parentType = component.parentType as GenericType;

      if (lastComponent.type is! GenericDefinitionType) {
        throw Exception(
            "Parent type ${lastComponent.type.typeName} should be generic.");
      }
      var parentDefinitionType = lastComponent.type as GenericDefinitionType;
      if (parentDefinitionType.genericParameters.length !=
          parentType.genericParameters.length) {
        throw Exception(
            "Parent type ${lastComponent.type.typeName} should have same amount of generic parameters as parent in ${component.type.typeName}.");
      }

      Map<String, ComponentType> typeNameReplacementMap = {};

      for (var i = 0; i < parentDefinitionType.genericParameters.length; i++) {
        typeNameReplacementMap[parentDefinitionType
            .genericParameters[i].typeName] = parentType.genericParameters[i];
      }

      _replaceTypesInParentComponents(parentComponents, typeNameReplacementMap);
      parentComponents.add(component);
      lastComponent = component;
    }
  }

  void _replaceTypesInParentComponents(List<ComponentDescription> components,
      Map<String, ComponentType> typeNameReplacementMap) {
    for (var component in components) {
      _replaceTypesInComponent(component, typeNameReplacementMap);
    }
  }

  void _replaceTypesInComponent(ComponentDescription component,
      Map<String, ComponentType> typeNameReplacementMap) {
    if (component.parentType != null) {
      component.parentType =
          _getReplacedType(component.parentType, typeNameReplacementMap);
    }
    for (var property in component.properties) {
      property.type = _getReplacedType(property.type, typeNameReplacementMap);
    }
  }

  ComponentType _getReplacedType(ComponentType componentType,
      Map<String, ComponentType> typeNameReplacementMap) {
    var replaceGenericTypeVisitor = ReplaceGenericTypeVisitor(
      typeNameReplacementMap: typeNameReplacementMap,
    );
    componentType.accept(replaceGenericTypeVisitor);

    return replaceGenericTypeVisitor.result;
  }
}
