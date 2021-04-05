import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TextFieldWidget extends StatefulWidget {
  final String? id;
  final String? text;
  final String? errorText;
  final String? label;
  final String? textInputType;
  final FormElementEventDispatcherFunction? dispatcher;

  const TextFieldWidget({
    Key? key,
    this.id,
    this.text,
    this.label,
    this.dispatcher,
    this.errorText,
    this.textInputType,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();

  VoidCallback? _listener;

  @override
  void initState() {
    super.initState();
    _listener = () => widget.dispatcher!(
          ChangeValueEvent(value: _controller.text, elementId: widget.id!),
        );
    _controller.addListener(_listener!);
  }

  @override
  void dispose() {
    if (_listener != null) {
      _controller.removeListener(_listener!);
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.text != widget.text) {
      _controller.text = widget.text!;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            labelText: widget.label, errorText: widget.errorText),
        keyboardType: getTextInputType(widget.textInputType),
        controller: _controller,
      ),
    );
  }

  TextInputType getTextInputType(String? textInputType) {
    TextInputType result;

    switch (textInputType) {
      case 'datetime':
        result = TextInputType.datetime;
        break;
      case 'emailAddress':
        result = TextInputType.emailAddress;
        break;
      case 'multiline':
        result = TextInputType.multiline;
        break;
      case 'number':
        result = TextInputType.number;
        break;
      case 'money':
        result = TextInputType.numberWithOptions(signed: false, decimal: true);
        break;
      case 'phone':
        result = TextInputType.phone;
        break;
      case 'text':
        result = TextInputType.text;
        break;
      case 'url':
        result = TextInputType.url;
        break;
      default:
        result = TextInputType.text;
        break;
    }
    return result;
  }
}
