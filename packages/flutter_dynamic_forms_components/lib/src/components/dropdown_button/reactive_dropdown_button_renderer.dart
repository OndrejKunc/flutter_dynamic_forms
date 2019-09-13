import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as model;

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
                  propertyName: model.SingleSelectGroup.valuePropertyName),
            ),
            items: element.choices
                .where((d) => d.isVisible)
                .whereType<model.DropdownOption>()
                .map<DropdownMenuItem<String>>(
              (model.DropdownOption option) {
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
