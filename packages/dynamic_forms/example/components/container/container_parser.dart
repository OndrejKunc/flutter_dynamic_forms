import 'package:dynamic_forms/dynamic_forms.dart';

import 'container.dart';

class ContainerParser extends ElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(
      ParserNode parserNode, Element parent, ElementParserFunction parser) {
    var container = Container();
    container.fillContainer(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      children: parserNode.getChildren<FormElement>(
          parent: container,
          childrenPropertyName: "children",
          parser: parser,
          isContentProperty: true),
    );
    return container;
  }
}
