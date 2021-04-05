import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms/src/form_element_event_dispatcher.dart';

class FormRenderService {
  final List<FormElementRenderer> renderers;
  final FormElementEventDispatcherFunction dispatcher;
  final Map<Type, FormElementRenderer> _renderersMap;

  FormRenderService({
    required this.renderers,
    required this.dispatcher,
  }) : _renderersMap = Map.fromIterable(renderers,
            key: ((p) => p.formElementType), value: ((p) => p));

  Widget render<TFormElement extends FormElement>(
      TFormElement formElement, BuildContext context) {
    var renderer = _renderersMap[formElement.runtimeType];
    if (renderer == null) {
      throw MissingRendererException(
        formElement,
        TFormElement.toString(),
      );
    }
    return renderer.render(formElement, context, dispatcher, render);
  }
}
