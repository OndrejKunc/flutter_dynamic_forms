import 'package:dynamic_forms/dynamic_forms.dart';
import '../container/container.dart';
import 'package:meta/meta.dart';

class FormGroup extends Container {
  static const String NAME_PROPERTY_NAME = "name";

  String get name => properties[NAME_PROPERTY_NAME].value;
  Stream<String> get nameChanged => properties[NAME_PROPERTY_NAME].valueChanged;

  void fillFormGroup(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<FormElement>> children,
      @required ElementValue<String> name}) {
    fillContainer(
        id: id, parent: parent, isVisible: isVisible, children: children);
    registerElementValue(NAME_PROPERTY_NAME, name);
  }

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
