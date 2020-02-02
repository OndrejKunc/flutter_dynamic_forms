import 'package:expression_language/expression_language.dart';
import 'package:bloc/bloc.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'dynamic_form_event.dart';
import 'dynamic_form_state.dart';

class DynamicFormBloc extends Bloc<FormElementEvent, DynamicFormState> {
  final FormManagerBuilder formManagerBuilder;

  FormManager formManager;

  DynamicFormBloc(this.formManagerBuilder);

  @override
  DynamicFormState get initialState => DynamicFormState();

  @override
  Stream<DynamicFormState> mapEventToState(FormElementEvent event) async* {
    if (event is LoadFormEvent) {
      yield state.copyWith(isLoading: true);

      await Future.delayed(Duration(seconds: 1));
      var xml =
          await rootBundle.loadString('assets/test_form1.xml', cache: false);
      formManager = formManagerBuilder.build(xml);

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
          resultItemValues: formManager.getFormData());
      return;
    }

    if (event is ClearFormDataEvent) {
      yield state.copyWith(
          isLoading: false,
          isValid: formManager.isFormValid,
          form: formManager.form,
          resultItemValues: List<FormItemValue>());
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

    if (event is CopyFirstChildEvent) {
      var children = event.copyContainer.children;
      if (children.isEmpty) {
        return;
      }

      // Create copy of the first children
      var clonedRoot = children[0].clone(null);

      var clonedElements =
          getFormElementIterator<FormElement>(clonedRoot).toList();

      // Change id of each element in the new tree
      for (var i = 0; i < clonedElements.length; i++) {
        var clonedElement = clonedElements[i];
        if (clonedElement.id == null) {
          continue;
        }
        clonedElement.id = "${clonedElement.id}_$i";
        formManager.formElementMap[clonedElement.id] = clonedElement;
      }

      // Build expressions in the cloned subtree
      var clonedExpressions =
          getFormPropertyIterator<CloneableExpressionProperty>(clonedRoot);
      for (var expressionValue in clonedExpressions) {
        expressionValue.buildExpression(formManager.formElementMap);
      }

      // Add subscriptions to existing expressions
      for (var expressionValue in clonedExpressions) {
        var elementsValuesCollectorVisitor =
            ExpressionProviderCollectorVisitor();
        expressionValue.getExpression().accept(elementsValuesCollectorVisitor);
        for (var sourceProperty
            in elementsValuesCollectorVisitor.expressionProviders) {
          (sourceProperty as Property).addSubscriber(expressionValue);
        }
      }

      (clonedRoot as FormElement).parentProperty = children[0].parentProperty;

      // Add back to the children list
      children.add(clonedRoot);

      // Notify view about the change. Easiest way how to trigger the change
      // is to add another mutable property to the model. Unfortunately children.add
      // doesn't trigger the change and there is no mechanism for this type of change yet.
      event.copyContainer.changedSubject.add(children.length);
    }
  }
}
