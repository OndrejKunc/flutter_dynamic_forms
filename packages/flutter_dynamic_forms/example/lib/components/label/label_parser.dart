import 'package:dynamic_forms/dynamic_forms.dart';

import 'label.dart';

class LabelParser<TLabel extends Label> extends FormElementParser<TLabel> {
  @override
  String get name => 'label';

  @override
  FormElement getInstance() => Label();

  @override
  void fillProperties(
    TLabel label,
    ParserNode parserNode,
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(label, parserNode, parent, parser);
    label
      ..valueProperty = parserNode.getStringProperty(
        'value',
        isImmutable: true,
      );
  }
}
