import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/src/form_element_event_dispatcher.dart';
import 'package:flutter_dynamic_forms/src/form_element_renderer_function.dart';

abstract class FormElementRenderer<TFormElement extends FormElement> {
  Widget render(
      TFormElement element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer);
  Type get formElementType => TFormElement;
}
