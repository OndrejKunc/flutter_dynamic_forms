# flutter_dynamic_forms

[![Build Status](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms.svg?branch=master)](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms)
[![codecov](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms/branch/master/graph/badge.svg)](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms)

A collection of flutter and dart libraries providing a solution for Server Driven UI in your Flutter application. 

| Package                                                                                                                                       | Pub                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [expression_language](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/expression_language)                           | [![pub package](https://img.shields.io/pub/v/expression_language.svg)](https://pub.dev/packages/expression_language)                           |
| [dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms)                                       | [![pub package](https://img.shields.io/pub/v/dynamic_forms.svg)](https://pub.dev/packages/dynamic_forms)                                       |
| [dynamic_forms_generator](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms_generator)                   | [![pub package](https://img.shields.io/pub/v/dynamic_forms_generator.svg)](https://pub.dev/packages/dynamic_forms_generator)                   |
| [flutter_dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/flutter_dynamic_forms)                       | [![pub package](https://img.shields.io/pub/v/flutter_dynamic_forms.svg)](https://pub.dev/packages/flutter_dynamic_forms)                       |
| [flutter_dynamic_forms_components](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/flutter_dynamic_forms_components) | [![pub package](https://img.shields.io/pub/v/flutter_dynamic_forms_components.svg)](https://pub.dev/packages/flutter_dynamic_forms_components) |

## Main goal

The idea behind this project is to be able to define your components via XML or JSON on the server and consume it in the Flutter client without redeploying the app. The main focus is on the ability to define custom components and complex relationships between their properties. For example, you can define custom validation rules, toggle visibility based on a condition, etc. This makes it especially useful when working with forms collecting some user input but it can be used to display any flutter widget tree.

## Simple example

Also see [example project](packages/flutter_dynamic_forms_components/example) which contains working demo.

```dart
import 'package:flutter/material.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class SimpleForm extends StatelessWidget {
  final String xmlString;

  const SimpleForm({Key key, this.xmlString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ParsedFormProvider( 
          create: (_) => XmlFormManager(), // Or use JsonFormManager() to parse JSON data
          content: xmlString,
          parsers: getDefaultParserList(), // Optionally add your custom parsers
          child: FormRenderer<XmlFormManager>( // Use matching FormManager type registered above
            renderers: getReactiveRenderers(), // Optionally add your custom renderers
          ),
        ),
      ),
    );
  }
}
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<form id="form1">
    <textField
        id="firstName"
        label="Enter your first name">
    </textField>
    <textField
        id="lastName"
        label="Enter your last name">
        <textField.validations>
            <requiredValidation
                message="Last name is required"/>
        </textField.validations>
    </textField>
    <label
        id="fullNameLabel">
        <label.value>
            <expression>
                <![CDATA[
                    @firstName + (length(@firstName) > 0 && length(@lastName) > 0 ? " " : "") + @lastName
                ]]>
            </expression>
        </label.value>
    </label>
    <label>
        <label.value>
            <expression>
                <![CDATA[
                    "Welcome " + @fullNameLabel + "!"
                ]]>
            </expression>
        </label.value>
        <label.isVisible>
            <expression>
                <![CDATA[
                    !@hideWelcomeCheckBox && length(@fullNameLabel) > 0
                ]]>
            </expression>
        </label.isVisible>
    </label>
    <checkBox
        id="hideWelcomeCheckBox"
        value="false"
        label="Hide welcome message"/>
</form>
```
If you prefer JSON to describe your form please check this [json example](packages/flutter_dynamic_forms_components/example/assets/test_form1.json).

<div align="center">
  <img src="docs/simple_form.gif" alt="An animated gif showing example output" />
  <br />
  <em>Example output</em>
</div>

## Simple Usage

### Installation

Add following dependencies to your `pubspec.yaml` file:

```yaml
flutter_dynamic_forms: <latest version>
flutter_dynamic_forms_components: <latest version>
```

### Displaying the form

The `flutter_dynamic_forms_components` library contains set of predefined components like `Label`, `CheckBox`, `RadioButtonGroup` etc. To make your app work with those components you need to perform the following steps:

First, you need to decide if you want to obtain your form data from XML or JSON. You can use either `JsonFormManager` or `XmlFormManager`.
Those classes will take care of parsing your forms. They also have a getter `form` which is the object representation of your XML/JSON form in Dart. They can also perform some useful operation on the form, like manipulating the state of the form when something happens in the UI, validating the form, or collecting all the data from the form so it can be sent back to the server. If you need to write custom logic into the FormManager you can easily extend it:
```dart
class CustomFormManager extends JsonFormManager { 
  Future<void> sendDataToServer() async {
    var properties = getFormProperties();
    // send properties to the server
  }
}
```

The easiest way to initialize your `FormManager` is via `ParsedFormProvider` widget. It will take your XML/JSON content, list of parsers and it will create the `FormManager` instance and also takes care of parsing your data. `ParsedFormProvider` is using the `Provider` package under the hood, so the `FormManager` will be available in your widget subtree by calling `FormProvider.of<YourFormProvider>(context)`.

To render your Form on the screen, you can use `FormRenderer` widget:
```dart
  FormRenderer<XmlFormManager>( 
    renderers: getReactiveRenderers(),
    formManager: myFormManagerInstance, // this is optional, can be resolved from the FormProvider 
    dispatcher: _onFormElementEvent, // optional, when omitted, it will delegate all change events to from manager
  )
```

You can provide your `FormManager` as a type: `FormRenderer<XmlFormManager>(...)` and it will be automatically resolved from previously defined `FormProvider` or you can pass specific `FormManager` instance into the `FormRenderer` constructor.

This widget also takes a list of renderers that controls how each model would be translated to the Flutter widget. In the example above, we use a set of predefined renderers. The word reactive means that each component will listen to the changes in the form model property and will update itself.

The last optional parameter is a `dispatcher`. It allows you to handle events derived from `FormElementEvent` produced in your render classes. When `dispatcher` parameter is not provided, only events of type `ChangeValueEvent` are processed and delegated directly to the FormManager instance causing changes of the property values. Use your own `dispatcher` handler if you need to send custom events (like a button click), but you should always let form manager handle the `ChangeValueEvent`:
```dart
  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName,
          ignoreLastChange: event.ignoreLastChange);
    }
    // process your own events
  }
```

### Collect data from the form

The idea behind the process of sending data back to the server is that we shouldn't send back the whole form but only values changed by the user.

To collect the data simply call:
```dart
List<FormPropertyValue> data = formManager.getFormData()
```

It contains a list of all the properties which were marked as a mutable in a component parser definition. In default components, those are the properties that are expected to be changed by a user. Each item contains the id of the source element, property name, and property value.
To submit the form you usually want to serialize this list and send it back to your server.

## Writing a custom component

The `flutter_dynamic_forms_components` package contains only a set of basic components related to a simple form application. 
Because of some requirements on my old app, not all components naming directly corresponds to the flutter widgets. I think that may change in the future.
Also when designing components, you can always choose between low-level components like `Label` or high-level component like `UserProfile`. In the case of this complex high-level component you let the client application completely control the look of the final widget. For those reasons I would recommend for each application to write its custom set of components to have complete control over each property.

To implement a custom component you need to provide 3 classes: `Parser`, `Model`, and `Renderer`. Parsers and Models then need to be registered when you are building the form as you can see in the code above. Let's show it on the `CheckBox` example:

### Parser
This class controls how the component would be deserialized into a corresponding model class. It works on both XML and JSON. `ParserNode` parameter contains a collection of methods that let you parse values from the current XML/JSON node. Use the `ElementParserFunction parser` parameter of the parse method to recursively parse children nodes.

```dart
import 'package:dynamic_forms/dynamic_forms.dart';
import 'check_box.dart';

class CheckBoxParser extends FormElementParser<CheckBox> {
  @override
  String get name => 'checkBox';

  @override
  FormElement getInstance() => CheckBox();

  @override
  void fillProperties(
    CheckBox checkBox,
    ParserNode parserNode,
    Element? parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(checkBox, parserNode, parent, parser);
    checkBox
      ..labelProperty = parserNode.getStringProperty('label')
      ..valueProperty = parserNode.getBoolProperty(
        'value',        
        isImmutable: false,
      );
  }
}
```

### Model
Model is the main component definition without any Flutter dependency. A component can extend other component inheriting all the properties. It can also contain components as its children.
Every property can contain either simple value or expression which is evaluated to the value. To be able to cover both of those cases all the properties must be defined using `Property<T>` syntax. Properties are stored in a single map called `properties` so you can easily traverse the whole component tree. It is a good idea to create getters and setters around this map so you can easily access and set property values.

```dart
import 'package:dynamic_forms/dynamic_forms.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = 'label';
  static const String valuePropertyName = 'value';

  Property<String> get labelProperty => properties[labelPropertyName];
  set labelProperty(Property<String> value) =>
      registerProperty(labelPropertyName, value);
  String get label =>
      labelProperty.value;
  Stream<String> get labelChanged => labelProperty.valueChanged;

  Property<bool> get valueProperty => properties[valuePropertyName];
  set valueProperty(Property<bool> value) =>
      registerProperty(valuePropertyName, value);
  bool get value =>
      valueProperty.value;
  Stream<bool> get valueChanged => valueProperty.valueChanged;

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
```

### Renderer
This class simply takes the model and returns a Flutter widget. You can also subscribe to the changes in the properties so your widget will be properly updated when something happens on the model. For this purpose use the Stream defined on each property or use the component property `propertyChanged` which returns Stream and emits value whenever any property changes. To redefine UI of the default components inside `flutter_dynamic_forms_components` simply define your renderers for the existing models. You can even have multiple renderers and show a different UI on a different screen. Use the `FormElementRendererFunction renderer` parameter of the render method to recursively render children.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'check_box.dart';

class CheckBoxRenderer extends FormElementRenderer<CheckBox> {
  @override
  Widget render(
      CheckBox element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          StreamBuilder<bool>(
            initialData: element.value,
            stream: element.valueChanged,
            builder: (context, snapshot) {
              return Checkbox(
                onChanged: (value) => dispatcher(
                      ChangeValueEvent(
                        value: value,
                        elementId: element.id,
                      ),
                    ),
                value: snapshot.data,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: StreamBuilder<String>(
              initialData: element.label,
              stream: element.labelChanged,
              builder: (context, snapshot) {
                return Text(snapshot.data);
              },
            ),
          )
        ],
      ),
    );
  }
}
```

### Generator

There is a lot of boilerplate when implementing `Parser` and `Model` classes. Because most of the apps will probably need to create a lot of custom components, there is also a [generator package](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms_generator) which lets you define components and their properties using simple YAML syntax. 