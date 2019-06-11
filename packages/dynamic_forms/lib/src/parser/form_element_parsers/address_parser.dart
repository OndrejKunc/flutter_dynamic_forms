import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:dynamic_forms/src/parser/form_element_parser.dart';
import 'package:dynamic_forms/src/parser/parsing_helpers.dart';
import 'package:xml/xml.dart';

class AddressParser extends FormElementParser<FormGroup> {
  @override
  String get name => "address";

  @override
  FormGroup parse(XmlElement element, FormElement parent,
      FormElementParserFunction parser) {
    var formGroup = FormGroup();
    var addressId = getAttribute(element, "id");

    var streetText = Text();
    streetText.fillText(
        id: "$addressId.street",
        isVisible: PrimitiveImmutableElementValue(true),
        parent: getParentValue(formGroup),
        value: getStringValue(element, "street", isImmutable: false),
        label: getValue(element, "streetLabel", convertToString, () => "Street"),
        textInputType: PrimitiveImmutableElementValue(""),
        validations: PrimitiveImmutableElementValue([])); //TODO add validations

    var cityText = Text();
    cityText.fillText(
        id: "$addressId.city",
        isVisible: PrimitiveImmutableElementValue(true),
        parent: getParentValue(formGroup),
        value: getStringValue(element, "city", isImmutable: false),
        label: getValue(element, "cityLabel", convertToString, () => "City"),
        textInputType: PrimitiveImmutableElementValue(""),
        validations: PrimitiveImmutableElementValue([])); //TODO add validations

    var zipText = Text();
    zipText.fillText(
        id: "$addressId.zip",
        isVisible: PrimitiveImmutableElementValue(true),
        parent: getParentValue(formGroup),
        value: getStringValue(element, "zip", isImmutable: false),
        label: getValue(element, "zipLabel", convertToString, () => "Zip"),
        textInputType: PrimitiveImmutableElementValue(""),
        validations: PrimitiveImmutableElementValue([])); //TODO add validations

    formGroup.fillFormGroup(
      id: addressId,
      isVisible: getIsVisible(element),
      parent: getParentValue(parent),
      name: getStringValue(element, "label"),
      children: PrimitiveImmutableElementValue([streetText, cityText, zipText]),
    );
    return formGroup;
  }
}
