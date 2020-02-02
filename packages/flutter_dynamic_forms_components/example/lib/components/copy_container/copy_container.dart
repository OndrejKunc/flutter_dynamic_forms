import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';

class CopyContainer extends Container {
  BehaviorSubject<int> changedSubject = BehaviorSubject<int>.seeded(0);
  Stream<int> get changedStream => changedSubject.stream;

  @override
  FormElement getInstance() {
    return FormGroup();
  }
}
