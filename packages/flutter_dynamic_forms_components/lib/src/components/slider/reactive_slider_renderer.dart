import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'slider.dart' as model;

class ReactiveSliderRenderer extends FormElementRenderer<model.Slider> {
  @override
  Widget render(
      model.Slider element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.valueChanged,
      builder: (BuildContext context, _) {
        print(element.division);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider.adaptive(
              value: element.value ?? 1.0,
              min: element.minValue,
              max: element.maxValue,
              activeColor: Color(element.activeColor),
              inactiveColor: Color(element.inactiveColor),
              label: element.division != 0 ? "${element.value}" : null,
              divisions: element.division != 0 ? element.division : null,
              onChanged: (double value) {
                dispatcher(
                  ChangeValueEvent(
                    value: value,
                    elementId: element.id,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
