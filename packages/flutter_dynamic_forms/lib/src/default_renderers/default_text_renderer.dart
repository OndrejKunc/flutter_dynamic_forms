import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms/src/widgets/text_widget.dart';

class DefaultTextRenderer extends FormElementRenderer<model.Text> {
  @override
  Widget render(
      model.Text element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var errorText = element.validations
        .firstWhere((v) => !v.isValid, orElse: () => null)
        ?.message;
    return TextWidget(
      text: element.value,
      id: element.id,
      errorText: errorText,
      label: element.label,
      textInputType: element.textInputType,
      dispatcher: dispatcher,
    );
  }
}
