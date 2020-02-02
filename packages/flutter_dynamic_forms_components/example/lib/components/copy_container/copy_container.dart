import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class CopyContainer extends Container {
  static const String itemCountPropertyName = 'itemCount';

  Property<int> get itemCountProperty => properties[itemCountPropertyName];
  set itemCountProperty(Property<int> value) =>
      registerProperty(itemCountPropertyName, value);
  int get itemCount => itemCountProperty.value;
  Stream<int> get itemCountChanged => itemCountProperty.valueChanged;

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
