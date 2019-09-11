import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class DropdownButton extends SingleSelectGroup<DropdownOption> {

  @override
  FormElement getInstance() {
    return DropdownButton();
  }
}
