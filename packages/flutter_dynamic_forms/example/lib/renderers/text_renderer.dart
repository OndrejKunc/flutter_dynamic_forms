import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TextRenderer extends FormElementRenderer<model.Text> {
  @override
  Widget render(
      model.Text element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    return TextWidget(
      text: element,
      dispatcher: dispatcher,
    );
  }
}

class TextWidget extends StatefulWidget {
  final model.Text text;
  final FormElementEventDispatcherFunction dispatcher;

  const TextWidget({
    Key key,
    this.text,
    this.dispatcher,
  }) : super(key: key);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  TextEditingController _controller = TextEditingController();

  VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () =>
        widget.dispatcher(ChangeValueEvent(_controller.text, widget.text.id));
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    if (_listener != null) {
      _controller?.removeListener(_listener);
    }
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var validation = widget.text.validations.value
        .firstWhere((v) => !v.isValid.value, orElse: () => null);

    if (_controller.text != widget.text.value.value) {
      _controller.text = widget.text.value.value;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: widget.text.label.value,
            errorText: validation?.message?.value),
        keyboardType: getTextInputType(widget.text.textInputType?.value),
        controller: _controller,
      ),
    );
  }

  TextInputType getTextInputType(String textInputType) {
    TextInputType result;

    switch (textInputType) {
      case "datetime":
        result = TextInputType.datetime;
        break;
      case "emailAddress":
        result = TextInputType.emailAddress;
        break;
      case "multiline":
        result = TextInputType.multiline;
        break;
      case "number":
        result = TextInputType.number;
        break;
      case "money":
        result = TextInputType.numberWithOptions(signed: false, decimal: true);
        break;
      case "phone":
        result = TextInputType.phone;
        break;
      case "text":
        result = TextInputType.text;
        break;
      case "url":
        result = TextInputType.url;
        break;
      default:
        result = TextInputType.text;
        break;
    }
    return result;
  }
}
