// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SliderParser extends ElementParser<Slider> {
  @override
  String get name => "slider";

  @override
  Slider parse(
      ParserNode parserNode, FormElement parent, ElementParserFunction parser) {
    var slider = Slider();
    slider.fillSlider(
      id: parserNode.getPlainStringValue("id"),
      parent: parserNode.getParentValue(parent),
      isVisible: parserNode.getIsVisible(),
      activeColor: parserNode.getValue<int>(
        "activeColor",
        (s) => int.parse(s),
        () => 4278190335,
        isImmutable: true,
      ),
      division: parserNode.getValue<int>(
        "division",
        (s) => int.parse(s),
        () => 0,
        isImmutable: true,
      ),
      inactiveColor: parserNode.getValue<int>(
        "inactiveColor",
        (s) => int.parse(s),
        () => 4290690750,
        isImmutable: true,
      ),
      label: parserNode.getStringValue(
        "label",
        isImmutable: true,
      ),
      maxValue: parserNode.getValue<double>(
        "maxValue",
        (s) => double.parse(s),
        () => 0,
        isImmutable: true,
      ),
      minValue: parserNode.getValue<double>(
        "minValue",
        (s) => double.parse(s),
        () => 0,
        isImmutable: true,
      ),
      value: parserNode.getValue<double>(
        "value",
        (s) => double.parse(s),
        () => 0,
        isImmutable: false,
      ),
    );
    return slider;
  }
}
