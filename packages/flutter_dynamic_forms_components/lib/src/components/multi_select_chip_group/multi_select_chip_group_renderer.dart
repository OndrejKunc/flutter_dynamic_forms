import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;
import 'package:rxdart/rxdart.dart';

class MultiSelectChipGroupRenderer
    extends FormElementRenderer<model.MultiSelectChipGroup> {
  @override
  Widget render(
      model.MultiSelectChipGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return LazyStreamBuilder(
      streamFactory: () => MergeStream(
        [
          ...element.choices.map((o) => o.isVisibleChanged),
          element.propertyChanged
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
