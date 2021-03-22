import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'text_field.dart' as model;
import 'text_field_widget.dart';

class TextFieldRenderer extends FormElementRenderer<model.TextField> {
  @override
  Widget render(
      model.TextField element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return StreamBuilder(
      stream: element.propertyChanged,
      builder: (context, _) {
        var errorText =
            element.validations.firstWhereOrNull((v) => !v.isValid)?.message;
        return TextFieldWidget(
          text: element.value,
          id: element.id,
          errorText: errorText,
          label: element.label,
          textInputType: element.textInputType,
          dispatcher: dispatcher,
        );
      },
    );
  }
}
