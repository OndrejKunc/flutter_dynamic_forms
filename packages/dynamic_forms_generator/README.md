# dynamic_forms_generator

[![pub package](https://img.shields.io/pub/v/dynamic_forms_generator.svg)](https://pub.dev/packages/dynamic_forms_generator)

Dart library for generating model and parser part of the [flutter_dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms).

## Main goal
 
There is a lots of boilerplate code needed to write a single component for the flutter_dynamic_forms. Especially in the model and parser classes. To simplify this task we can describe components in a simple Yaml format and let this generator create model and parser for us.

## Usage

Add this package as a dev dependency together with `build_runner`:

```yaml
dev_dependencies:
  build_runner: ^1.0.0
  dynamic_forms_generator: <latest version>
```

Optionally add a build.yaml to the root of your project to override default imports that should be generated in your files: 

```yaml
targets:
  $default:
    builders:
      dynamic_forms_generator:dynamicFormsBuilder:
        options:
          default_imports:
            - "../components.dart"
            components_to_ignore:
            - "form_element.yaml"
            - "validation.yaml"
```
`default_imports` will generate this import line to the both of model and parser files.

`components_to_ignore` will not generate anything for the listed components. Specifically `form_element.yaml` and `validation.yaml` are the default option so you don't need to explicitly list them. Reason why you don't want to generate anything for those classes is that they already have their models and parsers in the `dynamic_forms` library but other components can extend them and generator needs to have all the Yaml definitions in the project so it can correctly analyse their structure.

Other options are `model_imports` and `parser_imports` which generates imports at the beginning of the model or parser file. To distinct between different types of models there are also `form_element_model_imports`, `value_element_model_imports` and `enum_element_model_imports`.

For each component you would need corresponding `component_name.yaml` file in the format below.

Now you simply run
```
pub run build_runner build
```
or if you are using Flutter
```
flutter packages pub run build_runner build
```
Instead of `build` you can use `watch` to track changes. See [build_runner](https://pub.dev/packages/build_runner) package for more information.

## Component description structure

Each component should contain all the necessary info to be able to represent it in xml format.

Example component definitions:

```yaml
type: checkBox
parentType: formElement
properties:
  label:
    type: string
  value:
    type: bool
    default: false
    isMutable: true
```

```yaml
type: container
parentType: formElement
properties:
  children:
    type: formElement[]
contentProperty: children
```

```yaml
type: singleSelectGroup<tSingleSelectChoice extends singleSelectChoice>
parentType: formElement
properties:
  value:
    type: string
    isMutable: true
  choices:
    type: tSingleSelectChoice[]
```

```yaml
type: dropdownButton
parentType: singleSelectGroup<dropdownOption>
```

* Required `type` contains unique value which identifies the component.
    * Can contain optional generic parameters. 
        * Parameters are wrapped between `<` `>` and delimited by comma.
        * Each parameter can be followed by the `extend` keyword and other type which will further constraint the type.
* Optional `parentType` contains name of other element and it inherits all its properties and the `contentProperty`.
    * Can contain optional generic parameters. 
        * Parameters are wrapped between `<` `>` and delimited by comma.
* Optional `properties` section contains map of all the component properties.
    * Each key in this map corresponds to the property name and value contains other property descriptions.
        * Required `type` represents type of the property.
        * Optional `default` contains default value of the property when it is not explicitly set.
        * Optional `isMutable` contains optional info wheter state of the property can be mutated. Default is `false`. 
            * When set to `true` it is expected to be sent from a client back to a server.
* Optional `contentProperty` contains name of the property, which can be written directly as a child of the component element.

### Types

There are multiple types that can be set to the `type` in the property description:

* `int` - 64-bit two's complement integer
* `decimal`
* `bool`
* `string`
* `dateTime` - string as standardized format of date-time (ISO 8601)
* typename that ends with `valueElement` or `ValueElement` (e.g. `moneyValueElement`) - used for structures
* typename that ends with `enumElement` or `EnumElement` (e.g. `exampleEnumElement`) - used for enumerators
* `enum` - used only in `enumElement` components
* `customformElement` - name of the other component
* `customformElement[]` - array of the other components

Each type is nullable and when property is not set it defaults to the `null` (unless `default` key is defined).

### YAML -> XML
In XML the `name` corresponds to the element name. 

`parentType` is not represented in the xml.

Property can be written directly as an attribute of the element
```xml
<element propertyName="property value"/>
```
 and in case of complex values it can also be written as:
```xml
<element>
    <element.propertyName>
        property value
    </element.propertyName>
</element>
```
Each property which is not type `formElement` can also contain expression as the element value:
```xml
<element>
    <element.propertyName>
        <expression>
            1 + 1
        </expression>
    </element.propertyName>
</element>
```
See https://github.com/OndrejKunc/flutter_dynamic_forms to learn more about expressions.

`contentProperty` allows to write the selected property directly inside the element. In case of container it looks like this:
```xml
<container>
    <child1/>
    <child2/>
</container>
```

### YAML -> JSON

JSON has very similar mapping except that `contentProperty` is ignored.