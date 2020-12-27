# 0.14.0

* Increased expression_language dependency to ^0.4.0.
* Removed dependencies to uuid and quiver packages

# 0.13.1

Added support for `String`, `int` and `bool` types in json parser.

# 0.13.0

* Changed `FormManager` to abstract class and defined set of inherited classes that take care of building the form without the need to manually create `FormBuilder`.
* `FormManagerBuilder` renamed to `FormBuilder`.
* `FormItemValue` renamed to `FormPropertyValue`.
* Changed map of validations inside the `FormManager` to a list instead to avoid issues with missing ids.

# 0.12.0

* Increased minimum dart SDK to 2.8.4.
* Increased expression_language dependency to ^0.3.0.

# 0.11.0

* Changed `ParserNode` method suffixes from `Value` to `Property`.
* Added missing parser methods to `ParserNode`. 
* `GetEnum` in `ParserNode` no longer wraps enum in custom element.

# 0.10.1

Fixed analyzer issues.

# 0.10.0

* Increased minimum dart SDK to 2.6.0.
* Updated rxdart to `^0.23.1`.
* Replaced `Parser` for `ExpressionParser`.

# 0.9.0

* Renamed `ElementValue<T>` to `Property<T>`.
* `FormElement` and `Validation` now use property setters instead of `fill` method.
* Added base `FormElementParser` so parsers can be easily inherited from each other.

# 0.8.0

Fixed inconsistency in parsers.

# 0.7.0

Changed model hierarchy and parser naming. 

# 0.6.1

Published FormElement propertyChanged Stream so it can have multiple subscribers.

# 0.6.0

Added possibility to parse single child component.

# 0.5.0

Removed screaming caps convention.

# 0.4.0

- Added abstraction over XML parser.
- Added JSON parser.

# 0.3.0

Specific models and parsers were moved to the flutter_dynamic_forms_components package.

# 0.2.0

FormManager API Changes.

# 0.1.1

Updated the project description.

# 0.1.0

Initial Version of the library.