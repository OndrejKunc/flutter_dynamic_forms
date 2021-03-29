import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class TransitionFormElement extends FormElement {
  final FormElement child;
  final FormElementTransitionType transitionType;

  TransitionFormElement(this.child, this.transitionType) {
    registerProperty(
        FormElement.isVisiblePropertyName, ImmutableProperty<bool>(true));
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement>? parent) {
    return TransitionFormElement(this.child.clone(parent) as FormElement, this.transitionType);
  }

  @override
  FormElement getInstance() {
    return TransitionFormElement(child, transitionType);
  }
}

enum FormElementTransitionType {
  show,
  hide,
}
