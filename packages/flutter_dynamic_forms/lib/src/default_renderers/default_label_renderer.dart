import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DefaultLabelRenderer extends FormElementRenderer<model.Label> {
  @override
  Widget render(
      model.Label element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(element.value),
      ),
    );
  }
}
