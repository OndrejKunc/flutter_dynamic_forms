import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

@immutable
class TransitionFormState {
  final Form form;

  final bool isLoading;

  final bool isValid;

  final List<FormItemValue> resultItemValues;

  bool get isEmpty => form.children.value.length == 0;

  TransitionFormState(
      {this.form,
      this.isLoading = false,
      this.isValid = false,
      this.resultItemValues});

  TransitionFormState copyWith(
      {Form form,
      bool isLoading,
      bool isValid,
      List<FormItemValue> resultItemValues}) {
    return TransitionFormState(
        form: form ?? this.form,
        isLoading: isLoading ?? this.isLoading,
        isValid: isValid ?? this.isValid,
        resultItemValues: resultItemValues ?? this.resultItemValues);
  }
}
