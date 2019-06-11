import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';

typedef FormElementRendererFunction<TFormElement extends FormElement> = Widget
    Function(TFormElement formElement, BuildContext context);
