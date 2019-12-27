// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ContainerParser extends ElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var container = Container();
    container
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
      ..childrenProperty = parserNode.getChildren<FormElement>(
          parent: container,
          parser: parser,
          childrenPropertyName: "children",
          isContentProperty: true);
    return container;
  }
}
