// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class ContainerParser extends ElementParser<Container> {
  @override
  String get name => "container";

  @override
  Container parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var container = Container();
    container.fillContainer(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      children: parserNode.getChildren<FormElement>(
          parent: container,
          parser: parser,
          childrenPropertyName: "children",
          isContentProperty: true),
    );
    return container;
  }
}
