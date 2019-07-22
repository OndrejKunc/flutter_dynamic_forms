import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class CheckBoxParser extends FormElementParser<CheckBox> {
  @override
  String get name => "checkBox";

  @override
  CheckBox parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var checkBox = CheckBox();
    checkBox.fillCheckBox(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      value: getValue(element, "isValid", convertToBool, defaultFalse,
          isImmutable: false),
      label: getStringValue(element, "label"),
    );
    return checkBox;
  }
}
