import 'package:flutter/material.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/src/components/text_field/text_field_input_type.g.dart';

class TextFieldWidget extends StatefulWidget {
  final String id;
  final String text;
  final String? errorText;
  final String? label;
  final TextFieldInputType? textInputType;
  final FormElementEventDispatcherFunction dispatcher;

  const TextFieldWidget({
    Key? key,
    required this.id,
    required this.text,
    this.label,
    required this.dispatcher,
    this.errorText,
    this.textInputType,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();

  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () => widget.dispatcher(
          ChangeValueEvent(value: _controller.text, elementId: widget.id),
        );
    _controller.addListener(_listener);
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.text != widget.text) {
      _controller.text = widget.text;
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

  TextInputType getTextInputType(TextFieldInputType? textInputType) {
    TextInputType result;

    switch (textInputType) {
      case TextFieldInputType.datetime:
        result = TextInputType.datetime;
        break;
      case TextFieldInputType.emailAddress:
        result = TextInputType.emailAddress;
        break;
      case TextFieldInputType.multiline:
        result = TextInputType.multiline;
        break;
      case TextFieldInputType.number:
        result = TextInputType.number;
        break;
      case TextFieldInputType.money:
        result = TextInputType.numberWithOptions(signed: false, decimal: true);
        break;
      case TextFieldInputType.phone:
        result = TextInputType.phone;
        break;
      case TextFieldInputType.text:
        result = TextInputType.text;
        break;
      case TextFieldInputType.url:
        result = TextInputType.url;
        break;
      default:
        result = TextInputType.text;
        break;
    }
    return result;
  }
}
