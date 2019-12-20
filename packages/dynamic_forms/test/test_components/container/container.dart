import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Container extends FormElement {
  static const String childrenPropertyName = "children";
  static const String children2PropertyName = "children2";

  List<FormElement> get children => properties[childrenPropertyName].value;
  Stream<List<FormElement>> get childrenChanged =>
      properties[childrenPropertyName].valueChanged;

  List<FormElement> get children2 => properties[children2PropertyName].value;
  Stream<List<FormElement>> get children2Changed =>
      properties[children2PropertyName].valueChanged;

  void fillContainer({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<List<FormElement>> children,
    @required ElementValue<List<FormElement>> children2,
  }) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(childrenPropertyName, children);
    registerElementValue(children2PropertyName, children2);
  }

  @override
  FormElement getInstance() {
    return Container();
  }
}
