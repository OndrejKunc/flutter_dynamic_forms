import 'package:dynamic_forms/dynamic_forms.dart';

import 'container.dart';

class ContainerParser<TContainer extends Container>
    extends FormElementParser<TContainer> {
  @override
  String get name => 'container';

  @override
  FormElement getInstance() => Container();

  @override
  void fillProperties(
    TContainer container,
    ParserNode parserNode,
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(container, parserNode, parent, parser);
    container
      ..childrenProperty = parserNode.getChildrenProperty<FormElement>(
          parent: container,
          parser: parser,
          childrenPropertyName: 'children',
          isContentProperty: true);
  }
}
