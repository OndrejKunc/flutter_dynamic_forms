import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Container extends FormElement {
  final String CHILDREN_PROPERTY_NAME = "children";

  List<FormElement> get children => properties[CHILDREN_PROPERTY_NAME].value;
  Stream get childrenChanged => properties[CHILDREN_PROPERTY_NAME].valueChanged;

  void fillContainer(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<FormElement>> children}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    registerElementValue(CHILDREN_PROPERTY_NAME, children);
  }

  @override
  FormElement getInstance() {
    return Container();
  }
}
