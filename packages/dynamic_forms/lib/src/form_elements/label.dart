import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class Label extends FormElement {
  ElementValue<String> value;

  void fillLabel(
      {@required String id,
      @required ElementValue<ExpressionProviderElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<String> value}) {
    super.fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.value = registerElementValue("value", value);
  }
}
