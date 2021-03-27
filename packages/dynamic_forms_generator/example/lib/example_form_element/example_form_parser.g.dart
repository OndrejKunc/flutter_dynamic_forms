// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElementParser<TExampleFormElement extends ExampleFormElement>
    extends FormElementParser<TExampleFormElement> {
  @override
  String get name => 'exampleFormElement';

  @override
  FormElement getInstance() => ExampleFormElement();

  @override
  void fillProperties(
    TExampleFormElement exampleFormElement, 
    ParserNode parserNode, 
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(exampleFormElement, parserNode, parent, parser);
    exampleFormElement
      ..enumExampleProperty = parserNode.getEnumProperty(
        'enumExample',
        ExampleEnum.values,
        defaultValue: () => ExampleEnum.firstOption,
        isImmutable: true,
      )
      ..valueExampleProperty = parserNode.getChildProperty<ExampleValueElement>(
          parent: exampleFormElement,
          parser: parser,
          propertyName: 'valueExample',
          isContentProperty: false,
          defaultValue: () => ExampleValueElement(),
          isImmutable: true);
  }
}
