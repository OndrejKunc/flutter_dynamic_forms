import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class FormRenderer extends StatefulWidget {
  final List<FormElementRenderer> renderers;
  final FormElementEventDispatcherFunction dispatcher;
  final FormManager formManager;

  const FormRenderer({
    Key key,
    @required this.renderers,
    this.dispatcher,
    this.formManager,
  }) : super(key: key);

  @override
  _FormRendererState createState() => _FormRendererState();
}

class _FormRendererState extends State<FormRenderer> {
  FormRenderService _formRenderService;
  FormManager _formManager;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.formManager == null) {
      _formManager = FormProvider.of(context)?.formManager;
      if (_formManager == null) {
        throw Exception('''
Error: No `FormManager` provided to the `FormRenderer` widget. 
Please pass `FormManager` as the parameter to the `FormRenderer` 
or make sure you have `FormProvider` as your ancestor widget.
  ''');
      }
    } else {
      _formManager = widget.formManager;
    }
    _formRenderService = FormRenderService(
      renderers: widget.renderers,
      dispatcher: widget.dispatcher ?? _onFormElementEvent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _formRenderService.render(_formManager.form, context);
  }

  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName,
          ignoreLastChange: event.ignoreLastChange);
    }
  }
}
