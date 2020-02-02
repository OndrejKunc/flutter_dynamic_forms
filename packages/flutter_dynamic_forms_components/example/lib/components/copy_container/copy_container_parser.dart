// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

import 'copy_container.dart';

class CopyContainerParser<TCopyContainer extends CopyContainer>
    extends ContainerParser<TCopyContainer> {
  @override
  String get name => 'copyContainer';

  @override
  FormElement getInstance() => CopyContainer();

  @override
  void fillProperties(
    TCopyContainer formGroup,
    ParserNode parserNode,
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(formGroup, parserNode, parent, parser);
    formGroup
      ..itemCountProperty = parserNode.getIntProperty(
        'itemCount',
        defaultValue: ParserNode.defaultInt,
        isImmutable: false,
      );
  }
}
