import 'package:dynamic_forms/dynamic_forms.dart';

class MissingRendererException implements Exception {
  final String rendererType;
  final FormElement formElement;
  final StackTrace? stackTrace;
  MissingRendererException(this.formElement, this.rendererType,
      [this.stackTrace]);
  @override
  String toString() {
    return 'No renderer found.\n'
        'Provided renderer type: $rendererType\n'
        'Provided element: $formElement\n'
        '${stackTrace ?? ''}';
  }
}
