import 'package:dynamic_forms/dynamic_forms.dart';
import '../container/container.dart';
import 'package:meta/meta.dart';

class FormGroup extends Container {
  static const String namePropertyName = "name";

  String get name => properties[namePropertyName].value;
  Stream<String> get nameChanged => properties[namePropertyName].valueChanged;

  void fillFormGroup(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<FormElement>> children,
      @required ElementValue<String> name}) {
    fillContainer(
        id: id, parent: parent, isVisible: isVisible, children: children);
    registerElementValue(namePropertyName, name);
  }

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
