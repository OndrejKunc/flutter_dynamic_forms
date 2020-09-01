import 'package:dynamic_forms_generator/src/build_configuration.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/element_model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/enum_model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/form_element_model_generator.dart';
import 'package:dynamic_forms_generator/src/generator/model_generator/value_element_model_generator.dart';

import 'package:dynamic_forms_generator/src/model/component_description.dart';
import 'package:meta/meta.dart';

ElementModelGenerator getGenerator({
  @required String typeName,
  @required ComponentDescription componentDescription,
  @required BuildConfiguration buildConfiguration,
}) {
  ElementModelGenerator returnElement;
  if (typeName != null) {
    switch (typeName) {
      case 'enum':
        {
          returnElement = EnumModelGenerator();
          break;
        }
      case 'valueElement':
        {
          returnElement = ValueElementModelGenerator();
          returnElement.imports = [
            ...buildConfiguration.defaultImports,
            ...buildConfiguration.modelImports,
            ...buildConfiguration.valueElementModelImports
          ];
          break;
        }
      default:
        {
          returnElement = FormElementModelGenerator();
          returnElement.stronglyCastProperties =
              buildConfiguration.stronglyCastProperties;
          returnElement.imports = [
            ...buildConfiguration.defaultImports,
            ...buildConfiguration.modelImports,
            ...buildConfiguration.formElementModelImports
          ];
          break;
        }
    }
    returnElement.comments = buildConfiguration.comments;
    returnElement.componentDescription = componentDescription;

    return returnElement;
  } else {
    throw "Typename can't be null";
  }
}
