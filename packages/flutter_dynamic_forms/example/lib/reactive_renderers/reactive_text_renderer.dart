import 'package:dynamic_forms/dynamic_forms.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class ReactiveTextRenderer extends FormElementRenderer<model.Text> {
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
    return StreamBuilder<List<model.Validation>>(
      initialData: widget.text.validations,
      stream: widget.text.validationsChanged,
      builder: (context, validations) {
        return StreamBuilder<String>(
          initialData: widget.text.value,
          stream: widget.text.valueChanged,
          builder: (context, textValue) {
            return StreamBuilder<String>(
              initialData: widget.text.label,
              stream: widget.text.labelChanged,
              builder: (context, labelValue) {
                return StreamBuilder<String>(
                  initialData: widget.text?.textInputType ?? "text",
                  stream: widget.text?.textInputTypeChanged,
                  builder: (context, inputType) {
                    var validation = validations.data.firstWhere(
                        (v) => !v.isValid,
                        orElse: () => null);
                    if (_controller.text != textValue.data) {
                      _controller.text = textValue.data;
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: labelValue.data,
                            errorText: validation?.message),
                        keyboardType: getTextInputType(inputType.data),
                        controller: _controller,
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
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
