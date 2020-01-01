import 'package:dynamic_forms/dynamic_forms.dart';

class RequiredValidation extends Validation {
  @override
  FormElement getInstance() {
    return RequiredValidation();
  }
}
