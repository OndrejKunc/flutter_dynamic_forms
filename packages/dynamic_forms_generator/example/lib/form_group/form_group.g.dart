// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class FormGroup extends Container {
  static const String namePropertyName = "name";

  String get name => properties[namePropertyName].value;
  Stream<String> get nameChanged => properties[namePropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<FormElement>> children,
    @required ElementValue<String> name,
  }) {
  }

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
