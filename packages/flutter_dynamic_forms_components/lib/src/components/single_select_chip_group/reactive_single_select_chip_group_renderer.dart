import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_choice/single_select_chip_choice.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_chip_group/single_select_chip_group.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveSingleSelectChipGroupRenderer
    extends FormElementRenderer<SingleSelectChipGroup> {
  @override
  Widget render(
      SingleSelectChipGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Stream> streamsToReact = List<Stream>();
    streamsToReact.addAll(element.choices.map((o) => o.isVisibleChanged));
    streamsToReact.add(element.propertyChanged);
    return StreamBuilder<List<SingleSelectChipChoice>>(
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
