import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/form_manager/form_data.dart';
import 'package:meta/meta.dart';

class ExplicitFormManager extends FormManager {
  ExplicitFormManager({
    @required FormData formData,
  }) {
    fillFromFormData(formData);
  }
}
