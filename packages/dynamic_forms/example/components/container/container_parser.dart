import 'package:dynamic_forms/dynamic_forms.dart';

import 'container.dart';

class ContainerParser extends FormElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var container = Container();
    container.fillContainer(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      children: parserNode.getChildren<FormElement>(
          parent: container,
          childrenPropertyName: Container.CHILDREN_PROPERTY_NAME,
          parser: parser,
          isContentProperty: true),
    );
    return container;
  }
}
