import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'slider.g.dart' as model;

class SliderRenderer extends FormElementRenderer<model.Slider> {
  @override
  Widget render(
      model.Slider element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.propertyChanged,
      builder: (BuildContext context, _) {
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
                  ChangeValueEvent<double>(
                    value: value,
                    elementId: element.id!,
                    propertyName: model.Slider.valuePropertyName,
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
