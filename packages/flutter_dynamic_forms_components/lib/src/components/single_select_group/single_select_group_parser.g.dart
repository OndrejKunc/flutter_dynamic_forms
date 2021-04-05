// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

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
          isContentProperty: true)
      ..valueProperty = parserNode.getNullableStringProperty(
        'value',
        defaultValue: () => null,
        isImmutable: false,
      );
  }
}
