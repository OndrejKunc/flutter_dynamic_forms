import 'dart:collection';
import 'package:meta/meta.dart';

import 'package:dynamic_forms_generator/src/model/component_type.dart';
import 'package:dynamic_forms_generator/src/visitor/comopnent_type_visitor.dart';

class ReplaceGenericTypeVisitor extends ComponentTypeVisitor {
  final Queue<ComponentType> _componentStack = Queue<ComponentType>();
  final Map<String, ComponentType> typeNameReplacementMap;

  ReplaceGenericTypeVisitor({@required this.typeNameReplacementMap});

  void push(ComponentType component) {
    _componentStack.addLast(component);
  }

  ComponentType pop() {
    return _componentStack.removeLast();
  }

  ComponentType get result => _componentStack.first;

  @override
  void visitArrayType(ArrayType type) {
    type.innerType.accept(this);
    push(ArrayType(pop()));
  }

  @override
  void visitComponentType(ComponentType type) {
    if (typeNameReplacementMap.containsKey(type.typeName)) {
      push(typeNameReplacementMap[type.typeName]);
    } else {
      push(type);
    }
  }

  @override
  void visitDefinitionType(DefinitionType type) {
    push(type);
  }

  @override
  void visitGenericDefinitionType(GenericDefinitionType type) {
    for (var parameter in type.genericParameters) {
      parameter.accept(this);
    }
    var resultParameters = <GenericParameterType>[];
    for (var i = 0; i < type.genericParameters.length; i++) {
      resultParameters.insert(0, pop());
    }
    push(GenericDefinitionType(type.typeName, resultParameters));
  }

  @override
  void visitGenericParameterType(GenericParameterType type) {
    if (type.extendsType != null) {
      type.extendsType.accept(this);
      push(GenericParameterType(type.typeName, pop()));
    } else {
      push(GenericParameterType(type.typeName));
    }
  }

  @override
  void visitGenericType(GenericType type) {
    for (var parameter in type.genericParameters) {
      parameter.accept(this);
    }
    var resultParameters = <ComponentType>[];
    for (var i = 0; i < type.genericParameters.length; i++) {
      resultParameters.insert(0, pop());
    }
    push(GenericType(type.typeName, resultParameters));
  }
}
