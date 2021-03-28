// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

abstract class MultiSelectGroupParser<
        TMultiSelectGroup extends MultiSelectGroup<TMultiSelectChoice>,
        TMultiSelectChoice extends MultiSelectChoice>
    extends FormElementParser<TMultiSelectGroup> {

  @override
  void fillProperties(
    TMultiSelectGroup multiSelectGroup, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(multiSelectGroup, parserNode, parent, parser);
    multiSelectGroup
      ..choicesProperty = parserNode.getChildrenProperty<TMultiSelectChoice>(
          parent: multiSelectGroup,
          parser: parser,
          childrenPropertyName: 'choices',
          isContentProperty: true);
  }
}
