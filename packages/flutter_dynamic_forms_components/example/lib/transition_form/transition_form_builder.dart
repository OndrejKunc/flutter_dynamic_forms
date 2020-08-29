import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/components/transition_form_element/transition_form_element.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class TransitionFormBuilder {
  final FormBuilder formBuilder;

  TransitionFormBuilder(this.formBuilder);

  Form buildTranstionForm(Form oldForm, Form newForm) {
    var resultFormManager = formBuilder.buildFromForm(newForm);
    var resultForm = resultFormManager.form;
    addTransitionElements(oldForm, resultForm);
    return resultForm;
  }

  void addTransitionElements(
      FormElement oldElement, FormElement resultElement) {
    var oldFormGroups = getAllFormGroups(oldElement);
    var resultFormGroups = getAllFormGroups(resultElement);
    resultFormGroups.forEach((key, formGroup) {
      if (!oldFormGroups.containsKey(key)) {
        return;
      }
      var oldFormGroup = oldFormGroups[key];
      addTransitionElementsToFormGroup(oldFormGroup, formGroup);
    });
  }

  void addTransitionElementsToFormGroup(
      FormGroup oldFormGroup, FormGroup resultFormGroup) {
    var oldList = oldFormGroup.children;
    var resultList = resultFormGroup.children;
    var resultListCopy = List.from(resultList);

    int indexOfPrevious = 0;
    int addedElements = 0;
    for (int i = 0; i < oldList.length; i++) {
      var oldElement = oldList[i];
      var formElement = oldElement;
      var itemInResultList = resultListCopy.firstWhere(
          (o) => (o as FormElement).id == formElement.id,
          orElse: () => null);
      if (itemInResultList == null) {
        resultList.insert(indexOfPrevious + addedElements,
            TransitionFormElement(formElement, FormElementTransitionType.hide));
      } else {
        indexOfPrevious = i;
      }

      for (int i = 0; i < resultList.length; i++) {
        var resultElement = resultList[i];
        var formElement = resultElement;
        if (formElement is TransitionFormElement) {
          continue;
        }
        var itemInOldList = oldList.firstWhere((o) => o.id == formElement.id,
            orElse: () => null);
        if (itemInOldList == null) {
          resultList[i] = TransitionFormElement(
              resultElement, FormElementTransitionType.show);
        }
      }
    }
  }

  Map<String, FormGroup> getAllFormGroups(FormElement formElement) {
    var result = Map<String, FormGroup>();
    for (var formGroup in getFormElementIterator<FormGroup>(formElement)) {
      if (formGroup.id == null || formGroup.id == '') {
        continue;
      }
      result[formGroup.id] = formGroup;
    }
    return result;
  }
}
