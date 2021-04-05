// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class ItemsContainerParser<TItemsContainer extends ItemsContainer>
    extends FormElementParser<TItemsContainer> {
  @override
  String get name => 'itemsContainer';

  @override
  FormElement getInstance() => ItemsContainer();

  @override
  void fillProperties(
    TItemsContainer itemsContainer, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(itemsContainer, parserNode, parent, parser);
    itemsContainer
      ..childrenProperty = parserNode.getChildrenProperty<FormElement>(
          parent: itemsContainer,
          parser: parser,
          childrenPropertyName: 'children',
          isContentProperty: true);
  }
}
