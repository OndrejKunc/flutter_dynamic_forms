// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Form extends FormGroup {
  void fillForm({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<FormElement>> children,
    @required ElementValue<String> name,
  }) {
    fillFormGroup(
      id: id,
      parent: parent,
      isVisible: isVisible,
      children: children,
      name: name,
    );
  }

  @override
  FormElement getInstance() {
    return Form();
  }
}
