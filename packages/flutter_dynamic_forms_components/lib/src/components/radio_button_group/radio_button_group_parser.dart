import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

import 'radio_button_group.dart';
import '../radio_button/radio_button.dart';

class RadioButtonGroupParser extends FormElementParser<RadioButtonGroup> {
  @override
  String get name => "radioButtonGroup";

  @override
  RadioButtonGroup parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var radioButtonGroup = RadioButtonGroup();
    radioButtonGroup.fillRadioButtonGroup(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      value: getStringValue(element, "value", isImmutable: false),
      radioButtons: getChildren<RadioButton>(element, radioButtonGroup, parser),
      arrangemet: getValue<RadioButtonGroupArrangement>(
          element,
          "arrangement",
          (s) => RadioButtonGroupArrangement.values.firstWhere(
              (e) => e.toString() == "RadioButtonGroupArrangement." + s,
              orElse: () => RadioButtonGroupArrangement.vertical),
          () => RadioButtonGroupArrangement.vertical),
    );
    return radioButtonGroup;
  }
}
