import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/single_select_group/single_select_group.dart';
import 'package:rxdart/rxdart.dart';
import 'dropdown_button.dart' as model;
import '../dropdown_option/dropdown_option.dart';

class ReactiveDropdownButtonRenderer
    extends FormElementRenderer<model.DropdownButton> {
  @override
  Widget render(
      model.DropdownButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Stream> streamsToReact = List<Stream>();
    streamsToReact.addAll(element.choices.map((o) => o.isVisibleChanged));
    streamsToReact.add(element.propertyChanged);

    return LazyStreamBuilder(
      streamFactory: () => Observable.merge(streamsToReact),
      builder: (context, _) {
        return Center(
          child: DropdownButton<String>(
            value: element.value,
            onChanged: (String newValue) => dispatcher(
                  ChangeValueEvent(
                      value: newValue,
                      elementId: element.id,
                      propertyName: SingleSelectGroup.valuePropertyName),
                ),
            items: element.choices
                .where((d) => d.isVisible)
                .whereType<DropdownOption>()
                .map<DropdownMenuItem<String>>(
              (DropdownOption option) {
                return DropdownMenuItem<String>(
                  value: option.value,
                  child: Text(option.label),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
