import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class RadioButton extends SingleSelectChoice {

  @override
  FormElement getInstance() {
    return RadioButton();
  }
}
