import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectChipGroup extends MultiSelectGroup<MultiSelectChipChoice> {

  @override
  FormElement getInstance() {
    return MultiSelectChipGroup();
  }
}
