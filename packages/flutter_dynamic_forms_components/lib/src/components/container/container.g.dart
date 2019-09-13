// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Container extends FormElement {
  static const String childrenPropertyName = "children";

  List<FormElement> get children => properties[childrenPropertyName].value;
  Stream<List<FormElement>> get childrenChanged => properties[childrenPropertyName].valueChanged;

  void fillContainer({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<FormElement>> children,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(childrenPropertyName, children);
  }

  @override
  FormElement getInstance() {
    return Container();
  }
}
