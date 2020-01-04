// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';
import 'package:dynamic_forms/dynamic_forms.dart';

class SliderParser<TSlider extends Slider>
    extends FormElementParser<TSlider> {
  @override
  String get name => 'slider';

  @override
  FormElement getInstance() => Slider();

  @override
  void fillProperties(
    TSlider slider, 
    ParserNode parserNode, 
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(slider, parserNode, parent, parser);
    slider
      ..activeColorProperty = parserNode.getValue<int>(
        'activeColor',
        (s) => int.parse(s),
        () => 4278190335,
        isImmutable: true,
      )
      ..divisionProperty = parserNode.getValue<int>(
        'division',
        (s) => int.parse(s),
        () => 0,
        isImmutable: true,
      )
      ..inactiveColorProperty = parserNode.getValue<int>(
        'inactiveColor',
        (s) => int.parse(s),
        () => 4290690750,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..maxValueProperty = parserNode.getValue<double>(
        'maxValue',
        (s) => double.parse(s),
        () => 0,
        isImmutable: true,
      )
      ..minValueProperty = parserNode.getValue<double>(
        'minValue',
        (s) => double.parse(s),
        () => 0,
        isImmutable: true,
      )
      ..valueProperty = parserNode.getValue<double>(
        'value',
        (s) => double.parse(s),
        () => 0,
        isImmutable: false,
      );
  }
}
