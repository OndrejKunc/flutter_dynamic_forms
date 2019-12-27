import 'package:dynamic_forms/dynamic_forms.dart';

import 'container.dart';

class ContainerParser extends ElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(
      ParserNode parserNode, Element parent, ElementParserFunction parser) {
    var container = Container();
    container
      ..id = parserNode.getPlainStringValue("id")
      ..isVisibleProperty = parserNode.getIsVisible()
      ..parentProperty = parserNode.getParentValue(parent)
      ..childrenProperty = parserNode.getChildren<FormElement>(
          parent: container,
          childrenPropertyName: "children",
          parser: parser,
          isContentProperty: true)
      ..children2Property = parserNode.getChildren<FormElement>(
          parent: container,
          childrenPropertyName: "children2",
          parser: parser,
          isContentProperty: true);
    return container;
  }
}
