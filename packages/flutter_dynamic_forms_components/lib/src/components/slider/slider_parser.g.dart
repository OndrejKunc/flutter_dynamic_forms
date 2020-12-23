// GENERATED CODE - DO NOT MODIFY BY HAND

//ignore_for_file: unused_import
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
      ..activeColorProperty = parserNode.getIntProperty(
        'activeColor',      
        defaultValue: () => 4278190335,
        isImmutable: true,
      )
      ..divisionProperty = parserNode.getIntProperty(
        'division',      
        defaultValue: () => 0,
        isImmutable: true,
      )
      ..inactiveColorProperty = parserNode.getIntProperty(
        'inactiveColor',      
        defaultValue: () => 4290690750,
        isImmutable: true,
      )
      ..labelProperty = parserNode.getStringProperty(
        'label',
        defaultValue: ParserNode.defaultString,
        isImmutable: true,
      )
      ..maxValueProperty = parserNode.getDoubleProperty(
        'maxValue',
        defaultValue: () => 0,
        isImmutable: true,
      )
      ..minValueProperty = parserNode.getDoubleProperty(
        'minValue',
        defaultValue: () => 0,
        isImmutable: true,
      )
      ..valueProperty = parserNode.getDoubleProperty(
        'value',
        defaultValue: () => 0,
        isImmutable: false,
      );
  }
}
