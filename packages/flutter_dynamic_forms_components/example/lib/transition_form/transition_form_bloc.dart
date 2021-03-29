import 'package:bloc/bloc.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/transition_form/transition_form_builder.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class TransitionFormBloc extends Bloc<FormElementEvent, TransitionFormState> {
  static const Duration transitionDuration = Duration(milliseconds: 600);

  final FormBuilder formBuilder;
  final TransitionFormBuilder transitionFormBuilder;

  late FormData formData;
  FormManager? formManager;

  TransitionFormBloc(this.formBuilder, this.transitionFormBuilder)
      : super(TransitionFormState());

  @override
  Stream<TransitionFormState> mapEventToState(FormElementEvent event) async* {
    if (event is LoadFormEvent) {
      var xml = await rootBundle.loadString(
          'assets/transition_form${event.formNumber}.xml',
          cache: false);
      var oldForm = formManager?.form;
      formData = formBuilder.build(xml);
      formManager = ExplicitFormManager(formData: formData);
      TransitionFormState currentState = state;
      if (oldForm != null) {
        var transitionForm = transitionFormBuilder.buildTranstionForm(
            oldForm as Form, formManager!.form as Form);
        currentState = state.copyWith(
            isInTransition: true,
            isValid: true,
            form: transitionForm,
            selectedForm: event.formNumber);
        yield currentState;
        await Future.delayed(transitionDuration);
      }

      yield currentState.copyWith(
          isInTransition: false,
          isValid: formManager!.isFormValid,
          form: formManager!.form as Form?,
          selectedForm: event.formNumber);
      return;
    }

    if (event is ClearFormEvent) {
      formManager!.resetForm();
      yield state.copyWith(
        isInTransition: false,
        isValid: formManager!.isFormValid,
        form: formManager!.form as Form?,
      );
      return;
    }

    if (event is ChangeValueEvent) {
      formManager!.changeValue(
        value: event.value,
        elementId: event.elementId,
        propertyName: event.propertyName,
        ignoreLastChange: event.ignoreLastChange,
      );
      yield state.copyWith(isValid: formManager!.isFormValid);
    }
  }
}
