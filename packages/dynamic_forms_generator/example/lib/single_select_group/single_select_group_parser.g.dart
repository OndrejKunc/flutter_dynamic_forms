// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

abstract class SingleSelectGroupParser<
        TSingleSelectGroup extends SingleSelectGroup<TSingleSelectChoice>,
        TSingleSelectChoice extends SingleSelectChoice>
    extends FormElementParser<TSingleSelectGroup> {

  @override
  void fillProperties(
    TSingleSelectGroup singleSelectGroup, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(singleSelectGroup, parserNode, parent, parser);
    singleSelectGroup
      ..choicesProperty = parserNode.getChildrenProperty<TSingleSelectChoice>(
          parent: singleSelectGroup,
          parser: parser,
          childrenPropertyName: 'choices',
          isContentProperty: false)
      ..valueProperty = parserNode.getStringProperty(
        'value',
        defaultValue: ParserNode.defaultString,
        isImmutable: false,
      );
  }
}
