import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DropdownOption extends SingleSelectChoice {

  @override
  FormElement getInstance() {
    return DropdownOption();
  }
}
