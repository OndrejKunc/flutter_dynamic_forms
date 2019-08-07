import 'package:dynamic_forms/dynamic_forms.dart';

import '../form_group/form_group.dart';
import '../text/text.dart';

class AddressParser extends FormElementParser<FormGroup> {
  @override
  String get name => "address";

  @override
  FormGroup parse(ParserNode parserNode, FormElement parent,
      FormElementParserFunction parser) {
    var formGroup = FormGroup();
    var addressId = parserNode.getPlainStringValue("id");

    var streetText = Text();
    streetText.fillText(
        id: "$addressId.street",
        isVisible: ImmutableElementValue(true),
        parent: parserNode.getParentValue(formGroup),
        value: parserNode.getStringValue("street", isImmutable: false),
        label: parserNode.getValue(
            "streetLabel", ParserNode.convertToString, () => "Street"),
        textInputType: ImmutableElementValue(""),
        validations: ImmutableElementValue([])); //TODO add validations

    var cityText = Text();
    cityText.fillText(
        id: "$addressId.city",
        isVisible: ImmutableElementValue(true),
        parent: parserNode.getParentValue(formGroup),
        value: parserNode.getStringValue("city", isImmutable: false),
        label: parserNode.getValue(
            "cityLabel", ParserNode.convertToString, () => "City"),
        textInputType: ImmutableElementValue(""),
        validations: ImmutableElementValue([])); //TODO add validations

    var zipText = Text();
    zipText.fillText(
        id: "$addressId.zip",
        isVisible: ImmutableElementValue(true),
        parent: parserNode.getParentValue(formGroup),
        value: parserNode.getStringValue("zip", isImmutable: false),
        label: parserNode.getValue(
            "zipLabel", ParserNode.convertToString, () => "Zip"),
        textInputType: ImmutableElementValue(""),
        validations: ImmutableElementValue([])); //TODO add validations

    formGroup.fillFormGroup(
      id: addressId,
      isVisible: parserNode.getIsVisible(),
      parent: parserNode.getParentValue(parent),
      name: parserNode.getStringValue("label"),
      children: ImmutableElementValue([streetText, cityText, zipText]),
    );
    return formGroup;
  }
}
