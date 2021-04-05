import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:meta/meta.dart';

@immutable
class TransitionFormState {
  final Form? form;

  final bool isInTranstion;
  final int selectedForm;
  final bool isValid;

  bool get isEmpty => form!.children.isEmpty;

  TransitionFormState(
      {this.form,
      this.isInTranstion = false,
      this.isValid = false,
      this.selectedForm = 1});

  TransitionFormState copyWith(
      {Form? form, bool? isInTransition, bool? isValid, int? selectedForm}) {
    return TransitionFormState(
        form: form ?? this.form,
        isInTranstion: isInTransition ?? this.isInTranstion,
        isValid: isValid ?? this.isValid,
        selectedForm: selectedForm ?? this.selectedForm);
  }
}
