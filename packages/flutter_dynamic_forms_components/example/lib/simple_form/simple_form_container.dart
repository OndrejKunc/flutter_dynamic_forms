import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class SimpleFormContainer extends StatefulWidget {
  @override
  _SimpleFormContainerState createState() => _SimpleFormContainerState();
}

class _SimpleFormContainerState extends State<SimpleFormContainer> {
  FormRenderService _formRenderService;
  FormManager _formManager;
  FormElement _form;

  @override
  void initState() {
    super.initState();
    _formRenderService = FormRenderService(
      renderers: getReactiveRenderers(),
      dispatcher: _onFormElementEvent,
    );

    _loadForm();
  }

  Future _loadForm() async {
    var formManagerBuilder = FormManagerBuilder(
      XmlFormParserService(getDefaultParserList()),
    );

    var xml =
        await rootBundle.loadString("assets/test_form1.xml", cache: false);
    _formManager = formManagerBuilder.build(xml);
    setState(() {
      _form = _formManager.form;
    });
  }

  void _onFormElementEvent(FormElementEvent event) {
    if (event is ChangeValueEvent) {
      _formManager.changeValue(
          value: event.value,
          elementId: event.elementId,
          propertyName: event.propertyName,
          ignoreLastChange: event.ignoreLastChange);
    }
    //No need to call setState, because reactive renderers already listen to the changes.
    //Call setState when using regular renderers, but note that the whole form will be re-rendered.
  }

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
}
