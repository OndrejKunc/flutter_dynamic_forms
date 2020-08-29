import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class FormData {
  FormElement form;
  Map<String, FormElement> formElementMap;
  List<Validation> validations;
  List<MutableProperty> mutableValues;

  FormData({
    @required this.form,
    @required this.formElementMap,
    @required this.validations,
    @required this.mutableValues,
  });
}
