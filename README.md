# flutter_dynamic_forms

[![Build Status](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms.svg?branch=master)](https://travis-ci.com/OndrejKunc/flutter_dynamic_forms)
[![codecov](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms/branch/master/graph/badge.svg)](https://codecov.io/gh/OndrejKunc/flutter_dynamic_forms)

A collection of flutter and dart libraries allowing you to dynamicaly define your complex forms outside the app and consume it at runtime.

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
        <text.validations>
            <validation
                message="Name is too long">
                <validation.isValid>
                    <expression>
                        <![CDATA[
                            length(@firstName) < 15
                        ]]>
                    </expression>
                </validation.isValid>
            </validation>
        </text.validations>
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
