
import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:dynamic_forms_generator/src/model/raw_component_description.dart';

class ComponentDescriptionBuilder {
  ComponentDescription buildFromRawComponent(
      RawComponentDescription rawComponent) {
    var type = rawComponent.type;
    
    return ComponentDescription();
  }

  Type parseType(String typeString){
    StringBuffer buffer = StringBuffer();
    
  }
}
