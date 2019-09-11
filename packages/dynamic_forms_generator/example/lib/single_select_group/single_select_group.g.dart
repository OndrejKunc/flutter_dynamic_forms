import '../components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SingleSelectGroup<TSingleSelectChoice extends SingleSelectChoice> extends FormElement {

  @override
  FormElement getInstance() {
    return SingleSelectGroup();
  }
}
