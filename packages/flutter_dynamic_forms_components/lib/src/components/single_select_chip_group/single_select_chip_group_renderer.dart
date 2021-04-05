import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:rxdart/rxdart.dart';

class SingleSelectChipGroupRenderer
    extends FormElementRenderer<SingleSelectChipGroup> {
  @override
  Widget render(
      SingleSelectChipGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return LazyStreamBuilder(
      streamFactory: () => MergeStream(
        [
          element.propertyChanged,
          ...element.choices.map((child) => child.isVisibleChanged),
        ],
      ),
      builder: (context, _) {
        return Wrap(
          children: element.choices
              .where((c) => c.isVisible)
              .map((choice) => renderer(choice, context))
              .toList(),
        );
      },
    );
  }
}
