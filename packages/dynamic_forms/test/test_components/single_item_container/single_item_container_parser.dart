import 'package:dynamic_forms/dynamic_forms.dart';

import 'single_item_container.dart';

class SingleItemContainerParser extends ElementParser<SingleItemContainer> {
  @override
  String get name => "singleItemContainer";

  @override
  SingleItemContainer parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var container = SingleItemContainer();
    container.fillSingleItemContainer(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      child: parserNode.getChild<FormElement>(
          propertyName: "child",
          parent: container,
          parser: parser,
          isContentProperty: true,
          defaultValue: () => null),
    );
    return container;
  }
}
