import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class SingleItemContainer extends FormElement {
  static const String childPropertyName = "child";

  FormElement get child => properties[childPropertyName].value;
  Stream<FormElement> get childChanged =>
      properties[childPropertyName].valueChanged;

  void fillSingleItemContainer(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<FormElement> child}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(childPropertyName, child);
  }

  @override
  FormElement getInstance() {
    return SingleItemContainer();
  }
}
