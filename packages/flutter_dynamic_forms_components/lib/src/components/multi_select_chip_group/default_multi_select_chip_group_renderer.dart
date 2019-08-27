import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/multi_select_chip_group/multi_select_chip_group.dart';

class DefaultMultiSelectChipGroupRenderer
    extends FormElementRenderer<MultiSelectChipGroup> {
  @override
  Widget render(
      MultiSelectChipGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Wrap(
      children: element.choices
          .where((c) => c.isVisible)
          .map((choice) => renderer(choice, context))
          .toList(),
    );
  }
}
