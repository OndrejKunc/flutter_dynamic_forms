import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class FormRenderer extends StatefulWidget {
  final List<FormElementRenderer> renderers;
  final FormElementEventDispatcherFunction dispatcher;

  const FormRenderer({
    Key key,
    @required this.renderers,
    this.dispatcher,
  }) : super(key: key);

  @override
  _FormRendererState createState() => _FormRendererState();
}

class _FormRendererState extends State<FormRenderer> {
  FormRenderService _formRenderService;
  FormData _dynamicFormsData;

  @override
  void initState() {
    super.initState();
    _formRenderService = FormRenderService(
      renderers: widget.renderers,
      dispatcher: widget.dispatcher ?? _onFormElementEvent,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dynamicFormsData = FormProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return _formRenderService.render(
        _dynamicFormsData.formManager.form, context);
  }

  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _dynamicFormsData.formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName,
          ignoreLastChange: event.ignoreLastChange);
    }
  }
}
