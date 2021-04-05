# 1.0.0

* Migrated to stable null safety.
* Removed default renderers - using only reactive renderers. Reactive renderers are no longer using reactive prefix except FormRenderer which is using 'Default' prefix to avoid conflict with FormRenderer widget.
* getReactiveRenderers renamed to getRenderers
* Renamed container to itemsContainer to avoid conflict with Flutter container widget.

# 0.14.0

* Updated dependency for flutter dynamic forms.
* Added custom expressions example into the example project.

# 0.13.0

* Updated dependency for flutter dynamic forms.

# 0.12.0

* Updated dependency for flutter dynamic forms and generator.

# 0.11.0

* Made the text widget obsolete. Added textField widget instead.
* Using new parser methods from dynamic_forms 0.11.0.

# 0.10.1

Fixed analyzer issues.

# 0.10.0

* Updated dependency for flutter dynamic forms.
* Increased minimum dart SDK to 2.6.0.

# 0.9.0

* Updated dependency for flutter dynamic forms and generator.
* Components are now using new format for the Model and Parser classes.
* Removed address component.
* Date and DateRange components are now generated from YAML files.

# 0.8.0

Updated dependency for flutter dynamic forms and generator.

# 0.7.3

Added slider component.

# 0.7.2

Added date range component.

# 0.7.1

Added date component.

# 0.7.0

Updated dependency for flutter dynamic forms and generator.

# 0.6.0

* Added component generator.
* Added missing parsers. 

# 0.5.0

Added multi select chip group component.

# 0.4.0

* Added base class for select components.
* Added single select chip group component. 

# 0.3.0

Removed screaming caps convention.

# 0.2.0

Removed dependency on xml from parsers.

# 0.1.0

Initial Version of the library.