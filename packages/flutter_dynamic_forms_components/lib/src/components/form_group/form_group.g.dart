// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class FormGroup extends Container {
  static const String namePropertyName = "name";

  String get name => properties[namePropertyName].value;
  Stream<String> get nameChanged => properties[namePropertyName].valueChanged;

  void fillFormGroup({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<FormElement>> children,
    @required ElementValue<String> name,
  }) {
    fillContainer(
      id: id,
      parent: parent,
      isVisible: isVisible,
      children: children,
    );
    registerElementValue(namePropertyName, name);
  }

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
