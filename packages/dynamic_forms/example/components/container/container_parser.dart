import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:xml/xml.dart';

import 'container.dart';

class ContainerParser extends FormElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var container = Container();
    container.fillContainer(
      id: getAttribute(element, "id"),
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      children: getChildren<FormElement>(element, container, parser),
    );
    return container;
  }
}
