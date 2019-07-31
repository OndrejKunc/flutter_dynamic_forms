import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

import 'text.dart';

class TextParser extends FormElementParser<Text> {
  @override
  String get name => "text";

  @override
  Text parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var text = Text();
    text.fillText(
        id: getAttribute(element, "id"),
        isVisible: getIsVisible(element),
        parent: getParentValue(parent),
        value: getStringValue(element, "value", isImmutable: false),
        label: getStringValue(element, "label"),
        textInputType: getStringValue(element, "textInputType"),
        validations: getChildrenFromElement<Validation>(
            element, text, "validations", parser));
    return text;
  }
}
