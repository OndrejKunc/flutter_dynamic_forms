import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class RadioButtonGroup extends SingleSelectGroup<RadioButton> {

  @override
  FormElement getInstance() {
    return RadioButtonGroup();
  }
}
