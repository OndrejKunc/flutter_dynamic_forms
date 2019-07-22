abstract class FormElementEvent {}

class ChangeValueEvent<T> extends FormElementEvent {
  final T value;
  final String formElementId;
  final String propertyName;
  ChangeValueEvent(this.value, this.formElementId, [this.propertyName]);
}
