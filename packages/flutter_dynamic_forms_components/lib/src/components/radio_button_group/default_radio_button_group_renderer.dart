import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'radio_button_group.dart';

class DefaultRadioButtonGroupRenderer
    extends FormElementRenderer<RadioButtonGroup> {
  @override
  Widget render(
      RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        ...element.choices
            .where((c) => c.isVisible)
            .map((choice) => renderer(choice, context))
            .toList(),
      ],
    );
  }
}
