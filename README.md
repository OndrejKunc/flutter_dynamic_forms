# flutter_dynamic_forms

[![Build Status](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms.svg?branch=master)](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms)
[![codecov](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms/branch/master/graph/badge.svg)](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms)

A collection of flutter and dart libraries allowing you to dynamically define your complex forms outside the app and consume it at runtime.

| Package                                                                                                                                       | Pub                                                                                                                                            |
| --------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [expression_language](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/expression_language)                           | [![pub package](https://img.shields.io/pub/v/expression_language.svg)](https://pub.dev/packages/expression_language)                           |
| [dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms)                                       | [![pub package](https://img.shields.io/pub/v/dynamic_forms.svg)](https://pub.dev/packages/dynamic_forms)                                       |
| [dynamic_forms_generator](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms_generator)                   | [![pub package](https://img.shields.io/pub/v/dynamic_forms_generator.svg)](https://pub.dev/packages/dynamic_forms_generator)                   |
| [flutter_dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/flutter_dynamic_forms)                       | [![pub package](https://img.shields.io/pub/v/flutter_dynamic_forms.svg)](https://pub.dev/packages/flutter_dynamic_forms)                       |
| [flutter_dynamic_forms_components](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/flutter_dynamic_forms_components) | [![pub package](https://img.shields.io/pub/v/flutter_dynamic_forms_components.svg)](https://pub.dev/packages/flutter_dynamic_forms_components) |

## Main goal

The idea behind this project is to be able define your components via XML or JSON on the server and consume it in the Flutter client without redeploying the app. The main focus is on the ability to define custom components and complex relationships between their properties. For example you can define custom validation rules, toggle visibility based on a condition etc. This makes it especially useful when working with forms collecting some user input but it can be used to display any flutter widget tree.

## Simple example

Also see [example project](packages/flutter_dynamic_forms_components/example) which contains working demo.

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class SimpleFormScreen extends StatefulWidget {
  _SimpleFormScreenState createState() => _SimpleFormScreenState();
}

class _SimpleFormScreenState extends State<SimpleFormScreen> {
  FormRenderService _formRenderService;
  FormManager _formManager;
  FormElement _form;

  @override
  void initState() {
    super.initState();
    _buildForm();
  }

  Future _buildForm() async {
    var parsers = getDefaultParserList(); //Add your custom parsers
    var renderers = getReactiveRenderers(); //Add your custom renderers
    _formRenderService = FormRenderService(
      renderers: renderers,
      dispatcher: _onFormElementEvent,
    );

    //Use JsonFormParserService for the JSON format
    var formManagerBuilder = FormManagerBuilder(XmlFormParserService(parsers));
    var content = await rootBundle.loadString('assets/test_form1.xml'); //Load your form
    _formManager = formManagerBuilder.build(content);
    setState(() {
      _form = _formManager.form;
    });
  }

  //All the events from the form will end up here
  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: _form == null
              ? CircularProgressIndicator()
              : _formRenderService.render(_form, context),
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

The `flutter_dynamic_forms_components` library contains set of predefined components like `Text`, `Label`, `CheckBox`, `RadioButtonGroup` etc. To make your app work with those components you need to perform the following steps:

First, you need to create an object called `FormManager`. You can put it inside the `initState` method in your state of your `StatefulWidget`:
```dart
//Get your data somewhere, for demo purposes, we use local assets
var data = await rootBundle.loadString('assets/test_form.xml');

//Use either XmlFormParserService or JsonParserService depending on your form format.
//For default component set use the predefined parser list.
var formManagerBuilder = FormManagerBuilder(XmlFormParserService(getDefaultParserList()));

//Store the _formManager in your state.
_formManager = formManagerBuilder.build(data);
```
The `FormManager` has a getter `form` which is the object representation of your xml/json form in Dart. `FormManager` can also perform some useful operation on the form, like manipulating the state of the form when something happens in the UI, validating the form or collecting all the data from the form so it can be sent back to the server.


Before you can render your form, you also need to initialize `FormRenderService`. This service gets a list of renderers, where each renderer controls how each component would be rendered on the screen:
```dart
_formRenderService = FormRenderService(
    renderers: getReactiveRenderers(),
    dispatcher: _onFormElementEvent,
);
```
In this example, we use a set of predefined renderers. The word reactive means that each component will listen to the changes in the form model property and will update itself. The `dispatcher` parameter is the callback method which is sent from the renderers when some action is performed (like checkbox checked). We will just delegate this action to our `FormManager`:

```dart
void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
        _formManager.changeValue(
            value: event.value, elementId: event.elementId, propertyName: event.propertyName);
    }
}
```
Since we are using reactive renderers, we don't need to call `setState()` at the end of this method to re-render the form. The library itself will ensure that only the right properties of the form elements will be updated according to this change.

After that you must inform the widget that your form is ready to use:
```dart
setState(() {
    _form = _formManager.form;
});
```

And finally, define the build method:

```dart
@override
Widget build(BuildContext context) {
    if (_form == null) {
        return Center(
            child: CircularProgressIndicator(),
        );
    }
    return Center(
        child: SingleChildScrollView(
            child: _formRenderService.render(_form, context),
        ),
    );
}
```

And that's it! Now you can see your form in the action.

### Collect data from the form

The idea behind the process of sending data back to the server is that we shouldn't send back the whole form but only values changed by the user.

To collect the data simply call:
```dart
List<FormItemValue> data = formManager.getFormData()
```

It contains a list of all the properties which were marked as a mutable in a component parser definition. In default components those are the properties that are expected to be changed by a user. Each item contains id of the source element, property name, and property value.
To submit the form you usually want to serialize this list and send it back to your server.

## Writing a custom component

This library allows you to define your custom tree of the components. 

To implement a custom component you need to provide 3 classes: `Parser`, `Model` and `Renderer`. Parsers and Models then need to be registered when you are building the form as you can see in the code above. Let's show it on the `CheckBox` example:

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
    Element parent,
    ElementParserFunction parser,
  ) {
    super.fillProperties(checkBox, parserNode, parent, parser);
    checkBox
      ..labelProperty = parserNode.getStringValue(
        'label',
        isImmutable: true,
      )
      ..valueProperty = parserNode.getValue(
        'value',
        ParserNode.convertToBool,
        ParserNode.defaultFalse,
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