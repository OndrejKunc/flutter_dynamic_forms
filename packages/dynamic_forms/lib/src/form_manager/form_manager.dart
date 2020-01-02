import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_item_value.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:expression_language/expression_language.dart';
import 'package:meta/meta.dart';

class FormManager {
  FormElement form;
  Map<String, FormElement> formElementMap;
  Map<String, Validation> formValidations;

  List<MutableProperty> mutableValues;

  FormManager(
      this.form, this.formElementMap, this.formValidations, this.mutableValues);

  bool get isFormValid {
    return formValidations.values.every((v) => (v.isValid));
  }

  List<FormItemValue> getFormData() {
    List<FormItemValue> result = List<FormItemValue>();
    var formElements = getFormElementIterator<FormElement>(form).toList();

    formElements.forEach((fe) {
      var properties = fe.getProperties();
      properties.forEach((name, propVal) {
        if (propVal is MutableProperty &&
            !(propVal is Property<ExpressionProviderElement>) &&
            !(propVal is Property<List<ExpressionProviderElement>>)) {
          result.add(FormItemValue(fe.id, name, propVal.value.toString()));
        }
      });
    });

    return result;
  }

  void resetForm() {
    mutableValues.forEach((pmv) => pmv.resetValue());
  }

  void changeValue<T>({
    @required T value,
    @required String elementId,
    String propertyName,
    bool ignoreLastChange = false,
  }) {
    if (!formElementMap.containsKey(elementId)) {
      print(
          "Value cannot be changed because element $elementId is not present");
      return;
    }
    var formElement = formElementMap[elementId];
    var property = formElement.getProperty(propertyName);
    var mutableValue = property as MutableProperty<T>;
    if (mutableValue == null) {
      print(
          "Value cannot be changed because element $elementId is not mutable");
      return;
    }
    mutableValue.setValue(value, ignoreLastChange: ignoreLastChange);

    return;
  }
}
