import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:meta/meta.dart';

@immutable
class DynamicFormState {
  final Form form;

  final bool isLoading;

  final bool isValid;

  final List<FormPropertyValue> resultProperties;

  bool get isEmpty => form.children.isEmpty;

  DynamicFormState(
      {this.form,
      this.isLoading = false,
      this.isValid = false,
      this.resultProperties});

  DynamicFormState copyWith(
      {Form form,
      bool isLoading,
      bool isValid,
      List<FormPropertyValue> resultProperties}) {
    return DynamicFormState(
        form: form ?? this.form,
        isLoading: isLoading ?? this.isLoading,
        isValid: isValid ?? this.isValid,
        resultProperties: resultProperties ?? this.resultProperties);
  }
}
