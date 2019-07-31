import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class LoadFormEvent extends FormElementEvent {
  final int formNumber;

  LoadFormEvent(this.formNumber);
}

class ClearFormEvent extends FormElementEvent {}
