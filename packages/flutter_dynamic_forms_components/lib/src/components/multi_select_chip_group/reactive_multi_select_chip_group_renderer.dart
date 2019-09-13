import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;
import 'package:rxdart/rxdart.dart';

class ReactiveMultiSelectChipGroupRenderer
    extends FormElementRenderer<model.MultiSelectChipGroup> {
  @override
  Widget render(
      model.MultiSelectChipGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Stream> streamsToReact = List<Stream>();
    streamsToReact.addAll(element.choices.map((o) => o.isVisibleChanged));
    streamsToReact.add(element.propertyChanged);
    return StreamBuilder<List<model.MultiSelectChipChoice>>(
      initialData: element.choices,
      stream: element.choicesChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: Observable.merge(
            snapshot.data.map((child) => child.isVisibleChanged),
          ),
          builder: (context, _) => Wrap(
            children: element.choices
                .where((c) => c.isVisible)
                .map((choice) => renderer(choice, context))
                .toList(),
          ),
        );
      },
    );
  }
}
