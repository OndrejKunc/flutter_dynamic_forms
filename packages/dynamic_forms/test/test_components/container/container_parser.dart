import 'package:dynamic_forms/dynamic_forms.dart';

import 'container.dart';

class ContainerParser extends FormElementParser<Container> {
  @override
  String get name => 'container';

  @override
  FormElement getInstance() => Container();

  @override
  void fillProperties(
      Container container, ParserNode parserNode, Element? parent, parser) {
    super.fillProperties(container, parserNode, parent, parser);
    container
      ..childrenProperty = parserNode.getChildrenProperty<FormElement>(
          parent: container,
          childrenPropertyName: 'children',
          parser: parser,
          isContentProperty: true)
      ..children2Property = parserNode.getChildrenProperty<FormElement>(
          parent: container,
          childrenPropertyName: 'children2',
          parser: parser,
          isContentProperty: true);
  }
}
