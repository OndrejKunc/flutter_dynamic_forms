// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElementParser extends ElementParser<ExampleFormElement> {
  @override
  String get name => "exampleFormElement";

  @override
  ExampleFormElement parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var exampleFormElement = ExampleFormElement();
    exampleFormElement
      ..id = parserNode.getPlainStringValue("id")
      ..parentProperty = parserNode.getParentValue(parent)
      ..isVisibleProperty = parserNode.getIsVisible()
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
    return exampleFormElement;
  }
}
