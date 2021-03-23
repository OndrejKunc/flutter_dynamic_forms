import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/visitor/component_type_visitor.dart';

class CollectComponentTypeVisitor extends ComponentTypeVisitor {
  final List<ComponentType> allComponentTypes = [];

  @override
  void visitArrayType(ArrayType type) {
    allComponentTypes.add(type);
  }

  @override
  void visitComponentType(ComponentType type) {
    allComponentTypes.add(type);
  }

  @override
  void visitDefinitionType(DefinitionType type) {
    allComponentTypes.add(type);
  }

  @override
  void visitGenericDefinitionType(GenericDefinitionType type) {
    allComponentTypes.add(type);
    for (var parameter in type.genericParameters) {
      parameter.accept(this);
    }
  }

  @override
  void visitGenericParameterType(GenericParameterType type) {
    allComponentTypes.add(type);
    type.extendsType!.accept(this);
  }

  @override
  void visitGenericType(GenericType type) {
    allComponentTypes.add(type);
    for (var parameter in type.genericParameters) {
      parameter.accept(this);
    }
  }
}
