import 'package:bloc/bloc.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/bloc_dynamic_form/custom_form_manager.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'dynamic_form_event.dart';
import 'dynamic_form_state.dart';

class DynamicFormBloc extends Bloc<FormElementEvent, DynamicFormState> {
  CustomFormManager formManager;

  DynamicFormBloc(this.formManager);

  @override
  DynamicFormState get initialState => DynamicFormState();

  @override
  Stream<DynamicFormState> mapEventToState(FormElementEvent event) async* {
    if (event is LoadFormEvent) {
      yield state.copyWith(isLoading: true);

      await Future.delayed(Duration(seconds: 1));
      var xml =
          await rootBundle.loadString('assets/test_form1.xml', cache: false);
      formManager.init(content: xml, parsers: getDefaultParserList());

      yield state.copyWith(
          isLoading: false,
          isValid: formManager.isFormValid,
          form: formManager.form);
      return;
    }

    if (event is ClearFormEvent) {
      formManager.resetForm();
      yield state.copyWith(
          isLoading: false,
          isValid: formManager.isFormValid,
          form: formManager.form);
      return;
    }

    if (event is RequestFormDataEvent) {
      yield state.copyWith(
          isLoading: false,
          isValid: formManager.isFormValid,
          form: formManager.form,
          resultProperties: formManager.getFormProperties());
      return;
    }

    if (event is ClearFormDataEvent) {
      yield state.copyWith(
          isLoading: false,
          isValid: formManager.isFormValid,
          form: formManager.form,
          resultProperties: List<FormPropertyValue>());
      return;
    }

    if (event is ChangeValueEvent) {
      formManager.changeValue(
        value: event.value,
        elementId: event.elementId,
        propertyName: event.propertyName,
        ignoreLastChange: event.ignoreLastChange,
      );
      var isValid = formManager.isFormValid;
      //No need to emit new state every time, because reactive renderers already listen to the changes.
      if (state.isValid != isValid) {
        yield state.copyWith(isValid: isValid);
      }
    }
  }
}
