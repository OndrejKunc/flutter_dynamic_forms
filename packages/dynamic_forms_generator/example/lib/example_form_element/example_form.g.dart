// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class ExampleFormElement extends FormElement {
  static const String enumPropertyPropertyName = "enumProperty";
  static const String valuePropertyPropertyName = "valueProperty";

  ExampleEnumElement get enumProperty => properties[enumPropertyPropertyName].value;
  Stream<ExampleEnumElement> get enumPropertyChanged => properties[enumPropertyPropertyName].valueChanged;

  ExampleValueElement get valueProperty => properties[valuePropertyPropertyName].value;
  Stream<ExampleValueElement> get valuePropertyChanged => properties[valuePropertyPropertyName].valueChanged;

  void fillExampleFormElement({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<ExampleEnumElement> enumProperty,
    @required ElementValue<ExampleValueElement> valueProperty,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(enumPropertyPropertyName, enumProperty);
    registerElementValue(valuePropertyPropertyName, valueProperty);
  }

  @override
  FormElement getInstance() {
    return ExampleFormElement();
  }
}
