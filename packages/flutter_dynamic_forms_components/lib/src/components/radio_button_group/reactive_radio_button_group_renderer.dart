import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class ReactiveRadioButtonGroupRenderer
    extends FormElementRenderer<RadioButtonGroup> {
  @override
  Widget render(
      RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<RadioButton>>(
      initialData: element.choices,
      stream: element.choicesChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: Observable.merge(
            snapshot.data.map((child) => child.isVisibleChanged),
          ),
          builder: (context, _) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  ...element.choices
                      .where((c) => c.isVisible)
                      .map((choice) => renderer(choice, context))
                      .toList(),
                ],
              ),
        );
      },
    );
  }
}
