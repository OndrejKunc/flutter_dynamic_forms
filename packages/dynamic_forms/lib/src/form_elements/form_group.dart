import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_elements/form_element.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class FormGroup extends FormElement {
  ElementValue<List<ExpressionProviderElement>> children;
  ElementValue<String> name;

  void fillFormGroup(
      {@required String id,
      @required ElementValue<ExpressionProviderElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<ExpressionProviderElement>> children,
      @required ElementValue<String> name}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.children = registerElementValue("children", children);
    this.name = registerElementValue("name", name);
  }

  @override
  ExpressionProviderElement clone(ExpressionProvider<ExpressionProviderElement> parent) {
    var result = FormGroup();
    result.fillFormGroup(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      children: cloneChildren(children, result),
      name: this.name.clone(),
    );
    return result;
  }
}
