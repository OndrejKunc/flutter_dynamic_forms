// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElementParser<TExampleFormElement extends ExampleFormElement>
    extends FormElementParser<TExampleFormElement> {
  @override
  String get name => "exampleFormElement";

  @override
  FormElement getInstance() => ExampleFormElement();

  @override
  void fillProperties(
    TExampleFormElement exampleFormElement, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(exampleFormElement, parserNode, parent, parser);
    exampleFormElement
      ..enumExampleProperty = parserNode.getEnum<ExampleEnumElementEnum,ExampleEnumElement>(
          name: "enumExample",
          enumerationValues: ExampleEnumElementEnum.values,
          enumElementConstructor: (x) => ExampleEnumElement(enumeration: x))
          
      ..valueExampleProperty = parserNode.getChild<ExampleValueElement>(
          parent: exampleFormElement,
          parser: parser,
          propertyName: "valueExample",
          isContentProperty: false,
          defaultValue: () => ExampleValueElement(),
          isImmutable: true);
  }
}
