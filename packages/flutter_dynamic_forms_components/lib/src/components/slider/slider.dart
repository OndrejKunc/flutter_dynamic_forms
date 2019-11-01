import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:meta/meta.dart';

class Slider extends FormElement {
  static const String labelPropertyName = "label";
  static const String validationsPropertyName = "validations";
  static const String valuePropertyName = "value";
  static const String activeColorPropertyName = "activeColor";
  static const String minValuePropertyName = "minValue";
  static const String maxValuePropertyName = "maxValue";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  double get value => properties[valuePropertyName].value;
  Stream<double> get valueChanged => properties[valuePropertyName].valueChanged;

  int get activeColor => properties[activeColorPropertyName].value;
  double get minValue => properties[minValuePropertyName].value;
  double get maxValue => properties[maxValuePropertyName].value;

  void fillDate({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<double> value,
    @required ElementValue<int> activeColor,
    @required ElementValue<double> minValue,
    @required ElementValue<double> maxValue,
  }) {
    fillFormElement(
      id: id,
      parent: parent,
      isVisible: isVisible,
    );
    registerElementValue(labelPropertyName, label);
    registerElementValue(valuePropertyName, value);

    registerElementValue(activeColorPropertyName, activeColor);
    registerElementValue(minValuePropertyName, minValue);
    registerElementValue(maxValuePropertyName, maxValue);
  }

  @override
  FormElement getInstance() {
    return Slider();
  }
}
