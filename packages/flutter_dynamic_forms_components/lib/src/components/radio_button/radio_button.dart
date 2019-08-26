import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class RadioButton extends SingleSelectChoice {
  @override
  FormElement getInstance() {
    return RadioButton();
  }
}
