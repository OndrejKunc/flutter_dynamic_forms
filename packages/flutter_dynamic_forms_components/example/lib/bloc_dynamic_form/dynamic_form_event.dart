import 'package:example/components/copy_container/copy_container.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class LoadFormEvent extends FormElementEvent {}

class ClearFormEvent extends FormElementEvent {}

class RequestFormDataEvent extends FormElementEvent {}

class ClearFormDataEvent extends FormElementEvent {}

class CopyFirstChildEvent extends FormElementEvent {
  final CopyContainer copyContainer;

  CopyFirstChildEvent(this.copyContainer);
}
