import 'dart:collection';

import 'package:dynamic_forms/dynamic_forms.dart';

Iterable<TFormElement> getFormElementIterator<TFormElement extends FormElement>(
    FormElement formElement) sync* {
  var stack = Queue<FormElement>.from([formElement]);
  var visitedElements = {formElement};
  while (stack.isNotEmpty) {
    var formElement = stack.removeLast();
    visitedElements.add(formElement);
    if (formElement is TFormElement) {
      yield formElement;
    }
    var formElements = formElement
        .getProperties()
        .values
        .whereType<Property<FormElement>>()
        .map((v) => v.value)
        .toList();

    var convertedNullableFormElements = formElement
        .getProperties()
        .values
        .whereType<Property<FormElement?>>()
        .where((element) => element.value != null)
        .map((v) => v.value!)
        .toList();

    formElements.addAll(convertedNullableFormElements);

    var formListElements = formElement
        .getProperties()
        .values
        .whereType<Property<List<FormElement>>>()
        .map((v) => v.value)
        .expand((x) => x);
    formElements.addAll(formListElements);

    formElements.forEach((e) {
      if (!visitedElements.contains(e)) {
        stack.addLast(e);
      }
    });
  }
}
