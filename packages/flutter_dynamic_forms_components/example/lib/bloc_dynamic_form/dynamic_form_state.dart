import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:meta/meta.dart';

@immutable
class DynamicFormState {
  final Form form;

  final bool isLoading;

  final bool isValid;

  final List<FormItemValue> resultItemValues;

  bool get isEmpty => form.children.length == 0;

  DynamicFormState(
      {this.form,
      this.isLoading = false,
      this.isValid = false,
      this.resultItemValues});

  DynamicFormState copyWith(
      {Form form,
      bool isLoading,
      bool isValid,
      List<FormItemValue> resultItemValues}) {
    return DynamicFormState(
        form: form ?? this.form,
        isLoading: isLoading ?? this.isLoading,
        isValid: isValid ?? this.isValid,
        resultItemValues: resultItemValues ?? this.resultItemValues);
  }
}
