import 'dart:collection';

import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

Iterable<TFormElement> getFormElementIterator<TFormElement extends FormElement>(
    FormElement formElement) sync* {
  Queue<FormElement> stack = Queue<FormElement>.from([formElement]);
  Set<FormElement> visitedElements = {formElement};
  while (stack.isNotEmpty) {
    var formElement = stack.removeLast();
    visitedElements.add(formElement);
    if (formElement is TFormElement) {
      yield formElement;
    }
    var formElements = formElement
        .getProperties()
        .values
        .where((v) => v is ElementValue<ExpressionProviderElement>)
        .map((v) => v.value as FormElement)
        .toList();

    var formListElements = formElement
        .getProperties()
        .values
        .where((v) => v is ElementValue<List<ExpressionProviderElement>>)
        .map((v) => (v.value as List<ExpressionProviderElement>).cast<FormElement>())
        .expand((x) => x);
    formElements.addAll(formListElements);

    formElements.forEach((e) {
      if (!visitedElements.contains(e)) {
        stack.addLast(e);
      }
    });
  }
}
