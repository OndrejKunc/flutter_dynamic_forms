import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

import 'radio_button_group.dart';
import '../radio_button/radio_button.dart';

class ReactiveRadioButtonGroupRenderer
    extends FormElementRenderer<RadioButtonGroup> {
  @override
  Widget render(
      RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder<List<RadioButton>>(
      initialData: element.radioButtons,
      stream: element.radioButtonsChanged,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: Observable.merge(
            snapshot.data.map((child) => child.isVisibleChanged),
          ),
          builder: (context, _) {
            List<Widget> childrenWidgets = [
              Padding(
                padding: const EdgeInsets.all(8.0),
              )
            ];
            childrenWidgets.addAll(
              snapshot.data.where((f) => f.isVisible).map(
                    (child) => renderer(child, context),
                  ),
            );
            return Column(
              children: childrenWidgets,
            );
          },
        );
      },
    );
  }
}
