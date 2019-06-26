
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class Container extends FormElement {
  ElementValue<List<FormElement>> children;

  void fillContainer(
      {@required String id,
      @required ElementValue<FormElement> parent,
      @required ElementValue<bool> isVisible,
      @required ElementValue<List<FormElement>> children}) {
    fillFormElement(id: id, parent: parent, isVisible: isVisible);
    this.children = registerElementValue("children", children);
  }

  @override
  ExpressionProviderElement clone(ExpressionProvider<ExpressionProviderElement> parent) {
    var result = Container();
    result.fillContainer(
      id: this.id,
      parent: parent,
      isVisible: this.isVisible.clone(),
      children: cloneChildren(children, result),
    );
    return result;
  }
}