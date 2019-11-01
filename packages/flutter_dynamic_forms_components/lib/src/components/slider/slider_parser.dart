import 'package:dynamic_forms/dynamic_forms.dart';

import 'slider.dart';

class SliderParser extends ElementParser<Slider> {
  @override
  String get name => "slider";

  @override
  Slider parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var slider = Slider();
    slider.fillDate(
      id: parserNode.getPlainStringValue("id"),
      isVisible: parserNode.getIsVisible(),
      label: parserNode.getStringValue("label"),
      parent: parserNode.getParentValue(parent),
      value: parserNode.getDoubleValue("value", isImmutable: false),
      minValue: parserNode.getDoubleValue("minValue", isImmutable: true),
      maxValue: parserNode.getDoubleValue("maxValue", isImmutable: true),
      activeColor: parserNode.getValue(
        "activeColor",
        ParserNode.convertToColor,
        () => null,
      ),
    );
    return slider;
  }
}
