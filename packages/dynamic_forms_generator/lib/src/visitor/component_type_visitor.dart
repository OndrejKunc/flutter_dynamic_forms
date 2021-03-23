import 'package:dynamic_forms_generator/src/model/component_type.dart';

abstract class ComponentTypeVisitor {
  void visitComponentType(ComponentType type);
  void visitArrayType(ArrayType type);
  void visitGenericType(GenericType type);
  void visitGenericParameterType(GenericParameterType type);
  void visitGenericDefinitionType(GenericDefinitionType type);
  void visitDefinitionType(DefinitionType type);
}
