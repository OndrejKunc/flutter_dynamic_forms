import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';

Iterable<TProperty> getFormPropertyIterator<TProperty extends Property>(
    FormElement rootFormElement) sync* {
  for (var formElement
      in getFormElementIterator<FormElement>(rootFormElement)) {
    yield* formElement
        .getProperties()
        .values
        .where((v) => v is TProperty)
        .map(((v) => v as TProperty));
  }
}
