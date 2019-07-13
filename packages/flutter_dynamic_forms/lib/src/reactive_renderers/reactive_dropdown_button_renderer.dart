import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

class ReactiveDropdownButtonRenderer
    extends FormElementRenderer<model.DropdownButton> {
  @override
  Widget render(
      model.DropdownButton element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Stream> streamsToReact = List<Stream>();
    streamsToReact.addAll(element.options.map((o) => o.isVisible.valueChanged));
    streamsToReact.add(element.propertyChanged);

    return LazyStreamBuilder(
      streamFactory: () => Observable.merge(streamsToReact),
      builder: (context, _) {
        return Center(
          child: DropdownButton<String>(
            value: element.value,
            onChanged: (String newValue) => dispatcher(ChangeValueEvent(
                newValue, element.id, model.SELECTED_VALUE_PROPERTY)),
            items: element.options
                .where((d) => d.isVisible.value)
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
