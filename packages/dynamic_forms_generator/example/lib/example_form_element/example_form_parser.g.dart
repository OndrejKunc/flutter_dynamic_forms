// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';

class ExampleFormElementParser extends ElementParser<ExampleFormElement> {
  @override
  String get name => "exampleFormElement";

  @override
  ExampleFormElement parse(ParserNode parserNode, FormElement parent,
      ElementParserFunction parser) {
    var exampleFormElement = ExampleFormElement();
    exampleFormElement.fillExampleFormElement(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      enumProperty: parserNode.getEnum<ExampleEnumElementEnum,ExampleEnumElement>(
          name: "enumProperty",
          enumerationValues: ExampleEnumElementEnum.values,
          enumElementConstructor: (x) => ExampleEnumElement(enumeration: x))
          ,
      valueProperty: parserNode.getChild<ExampleValueElement>(
          parent: exampleFormElement,
          parser: parser,
          propertyName: "valueProperty",
          childName: "exampleValueElement",
          isContentProperty: false,
          defaultValue: () => ExampleValueElement(),
          isImmutable: true),
    );
    return exampleFormElement;
  }
}
