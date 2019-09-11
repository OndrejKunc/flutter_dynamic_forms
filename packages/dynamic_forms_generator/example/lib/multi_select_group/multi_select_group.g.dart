import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class MultiSelectGroup<TMultiSelectChoice extends MultiSelectChoice> extends FormElement {

  @override
  FormElement getInstance() {
    return MultiSelectGroup();
  }
}
