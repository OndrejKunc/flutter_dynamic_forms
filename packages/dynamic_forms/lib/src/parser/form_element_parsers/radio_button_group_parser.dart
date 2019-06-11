import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

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
      children: PrimitiveMutableElementValue(element.children
          .where((c) => c is XmlElement)
          .map((c) => parser(c, radioButtonGroup) as RadioButton)
          .toList()),
    );
    return radioButtonGroup;
  }
}
