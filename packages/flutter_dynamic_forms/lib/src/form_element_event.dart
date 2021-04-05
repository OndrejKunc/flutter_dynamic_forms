import 'package:meta/meta.dart';

abstract class FormElementEvent {}

@immutable
class ChangeValueEvent<T> extends FormElementEvent {
  final T value;
  final String elementId;
  final String? propertyName;
  final bool ignoreLastChange;

  ChangeValueEvent({
    required this.value,
    required this.elementId,
    this.propertyName,
    this.ignoreLastChange = false,
  });
}

@immutable
class ChangeMultipleValuesEvent extends FormElementEvent {
  final List<ChangeValueEvent> changeValueEvents;

  ChangeMultipleValuesEvent(this.changeValueEvents);
}
