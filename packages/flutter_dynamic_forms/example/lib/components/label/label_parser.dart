import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

import 'label.dart';

class LabelParser extends FormElementParser<Label> {
  @override
  String get name => "label";

  @override
  Label parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var label = Label();
    label.fillLabel(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      value: getStringValue(element, "value"),
    );
    return label;
  }
}
