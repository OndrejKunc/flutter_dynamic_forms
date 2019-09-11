import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectChipGroup extends SingleSelectGroup<SingleSelectChipChoice> {

  @override
  FormElement getInstance() {
    return SingleSelectChipGroup();
  }
}
