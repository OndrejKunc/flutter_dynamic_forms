# flutter_dynamic_forms

[![Build Status](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms.svg?branch=master)](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms)
[![codecov](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms/branch/master/graph/badge.svg)](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms)

A collection of flutter and dart libraries allowing you to dynamicaly define your complex forms outside the app and consume it at runtime.

| Package                                                                            | Pub                                                                                                             |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [expression_language](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/expression_language)                 | [![pub package](https://img.shields.io/pub/v/expression_language.svg)](https://pub.dev/packages/expression_language)                 |
| [dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/dynamic_forms) | [![pub package](https://img.shields.io/pub/v/dynamic_forms.svg)](https://pub.dev/packages/dynamic_forms) |
| [flutter_dynamic_forms](https://github.com/OndrejKunc/flutter_dynamic_forms/tree/master/packages/flutter_dynamic_forms) | [![pub package](https://img.shields.io/pub/v/flutter_dynamic_forms.svg)](https://pub.dev/packages/flutter_dynamic_forms) |

## Main goal

The idea behind this project is to be able define your forms with all the inputs, validation logic and other rules on the server and consume it in the flutter client without redeploying the app.

This is achieved by defining the form via XML using XAML like syntax. It has its own expression language to describe all the relationships between properties of each element.

See [example project](packages/flutter_dynamic_forms/example) which contains working demo

## Form definition example

```xml
<?xml version="1.0" encoding="UTF-8"?>
<form id="form1">
    <text
        id="firstName"
        label="Enter your first name">
    </text>
    <text
        id="lastName"
        label="Enter your last name">
        <text.validations>
            <requiredValidation
                message="Last name is required"/>
        </text.validations>
    </text>
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


<div align="center">
  <img src="docs/simple_form.gif" alt="An animated gif showing example output" />
  <br />
  <em>Example output</em>
</div>

## Simple Usage

This library contains set of predefined components like Text Input, Label, CheckBox, RadioButtonGroup etc. To make your app work with those components you need to perform the following steps:

First you need to create object called `FormManager`. You can put it inside the `initState` method in your state of your `StatefulWidget`:
```dart
//Get your XML somewhere, for demo purposes we use local assets
var xml = await rootBundle.loadString("assets/test_form1.xml");

//For default component set use predefined parser list.
var formManagerBuilder = FormManagerBuilder(FormParserService(getDefaultParserList()));

//Store the _formManager in your state.
_formManager = formManagerBuilder.build(xml);
```
The `FormManager` has a getter `form` which is the object representation of your xml in Dart. `FormManager` can also perform some useful operation on the form, like manipulating the state of the form when something happens in the UI, validating the form or collecting all the data from the form so it can be for example sent back to the server.


Before you can render your form, you also need to initialize `FormRenderService`. This service gets list of renderers, where each renderer controls how each component would be rendered on the screen:
```dart
_formRenderService = FormRenderService(
    renderers: getReactiveRenderers(),
    dispatcher: _onFormElementEvent,
);
```
In this example we use set of predefined renderers. The word reactive means that each component will listen to the changes in the form model and will update itself. The `dispatcher` parameter is the callback method which is sent from the renderers when some action is performed (like checkbox checked). We will just delegate this action to our `FormManager`:

```dart
void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
        _formManager.changeValue(
            event.value, event.formElementId, event.propertyName);
    }
}
```
Since we are using reactive renderes, we don't need to call `setState()` at the end of this method to re-render the form. The library itself will ensure that only the right properties of the form elements will be updated according to this change.

After that you must inform the widget that your form is ready to use:
```dart
setState(() {
    _form = _formManager.form;
});
```

And finally define the build method:

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