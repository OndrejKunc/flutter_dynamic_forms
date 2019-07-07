import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class ReactiveTextRenderer extends FormElementRenderer<model.Text> {
  @override
  Widget render(
      model.Text element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return TextWidget(
      text: element,
      dispatcher: dispatcher,
    );
  }
}
