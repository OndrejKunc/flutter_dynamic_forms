import 'package:dynamic_forms/dynamic_forms.dart';

/// This is a shorthand for validation with expression @textId.length > 0.
class RequiredValidation extends Validation {
  @override
  FormElement getInstance() {
    return RequiredValidation();
  }
}
