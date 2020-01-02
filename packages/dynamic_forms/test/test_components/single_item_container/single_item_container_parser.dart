import 'package:dynamic_forms/dynamic_forms.dart';

import 'single_item_container.dart';

class SingleItemContainerParser extends ElementParser<SingleItemContainer> {
  @override
  String get name => "singleItemContainer";

  @override
  SingleItemContainer parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var container = SingleItemContainer();
    container
      ..id = parserNode.getPlainStringValue("id")
      ..isVisibleProperty = parserNode.getIsVisible()
      ..parentProperty = parserNode.getParentValue(parent)
      ..childProperty = parserNode.getChild<FormElement>(
          propertyName: "child",
          parent: container,
          parser: parser,
          isContentProperty: true,
          defaultValue: () => null);
    return container;
  }
}
