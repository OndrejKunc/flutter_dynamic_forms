import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_data.dart';
import 'package:dynamic_forms/src/form_manager/form_property_value.dart';
import 'package:dynamic_forms/src/iterators/form_element_iterator.dart';
import 'package:expression_language/expression_language.dart';

abstract class FormManager {
  late FormElement form;
  late Map<String, FormElement> formElementMap;
  late List<Validation> validations;
  late List<MutableProperty> mutableValues;

  bool get isFormValid {
    return validations.every((v) => (v.isValid));
  }

  void fillFromFormData(FormData formData) {
    form = formData.form;
    formElementMap = formData.formElementMap;
    validations = formData.validations;
    mutableValues = formData.mutableValues;
  }

  List<FormPropertyValue> getFormProperties() {
    var result = <FormPropertyValue>[];
    var formElements = getFormElementIterator<FormElement>(form).toList();

    formElements.forEach((fe) {
      var properties = fe.getProperties();
      properties.forEach((name, propVal) {
        if (propVal is MutableProperty &&
            !(propVal is Property<ExpressionProviderElement>) &&
            !(propVal is Property<List<ExpressionProviderElement>>)) {
          result.add(FormPropertyValue(fe.id!, name, propVal.value.toString()));
        }
      });
    });

    return result;
  }

  void resetForm() {
    mutableValues.forEach((pmv) => pmv.resetValue());
  }

  void changeValue<T>({
    required T value,
    required String elementId,
    String? propertyName,
    bool ignoreLastChange = false,
  }) {
    if (!formElementMap.containsKey(elementId)) {
      print(
          'Value cannot be changed because element $elementId is not present');
      return;
    }
    var formElement = formElementMap[elementId]!;
    var property = formElement.getProperty(propertyName);
    if (property is MutableProperty<T>) {
      property.setValue(value, ignoreLastChange: ignoreLastChange);
    } else {
      print(
          'Value cannot be changed because element $elementId is not mutable');
    }
  }

  void close() {}
}
