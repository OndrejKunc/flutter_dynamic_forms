import 'package:bloc/bloc.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/transition_form/transition_form_builder.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TransitionFormBloc extends Bloc<FormElementEvent, TransitionFormState> {
  static const Duration transitionDuration = Duration(milliseconds: 600);

  final FormManagerBuilder formManagerBuilder;
  final TransitionFormBuilder transitionFormBuilder;

  FormManager formManager;

  TransitionFormBloc(this.formManagerBuilder, this.transitionFormBuilder);

  @override
  TransitionFormState get initialState => TransitionFormState();

  @override
  Stream<TransitionFormState> mapEventToState(FormElementEvent event) async* {
    if (event is LoadFormEvent) {
      var xml = await rootBundle.loadString(
          "assets/transition_form${event.formNumber}.xml",
          cache: false);
      var oldForm = formManager?.form;
      formManager = formManagerBuilder.build(xml);
      var state = currentState;
      if (oldForm != null) {
        var transitionForm =
            transitionFormBuilder.buildTranstionForm(oldForm, formManager.form);
        state = currentState.copyWith(
            isInTransition: true,
            isValid: true,
            form: transitionForm,
            selectedForm: event.formNumber);
        yield state;
        await Future.delayed(transitionDuration);
      }

      yield state.copyWith(
          isInTransition: false,
          isValid: formManager.isFormValid,
          form: formManager.form,
          selectedForm: event.formNumber);
      return;
    }

    if (event is ClearFormEvent) {
      formManager.resetForm();
      yield currentState.copyWith(
        isInTransition: false,
        isValid: formManager.isFormValid,
        form: formManager.form,
      );
      return;
    }

    if (event is ChangeValueEvent) {
      if (event is ChangeValueEvent<int>) {
        formManager.changeValue(
            event.value, event.formElementId, event.propertyName);
      }
      if (event is ChangeValueEvent<String>) {
        formManager.changeValue(
            event.value, event.formElementId, event.propertyName);
      }
      if (event is ChangeValueEvent<bool>) {
        formManager.changeValue(
            event.value, event.formElementId, event.propertyName);
      }
      if (event is ChangeValueEvent<double>) {
        formManager.changeValue(
            event.value, event.formElementId, event.propertyName);
      }
      yield currentState.copyWith(isValid: formManager.isFormValid);
    }
  }
}
