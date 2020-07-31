import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

abstract class FormProvider extends StatefulWidget {
  final Widget child;
  final String formString;
  final List<ElementParser> parsers;

  const FormProvider({
    Key key,
    @required this.child,
    @required this.formString,
    @required this.parsers,
  }) : super(key: key);

  static FormData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormData>();
  }

  @protected
  FormParserService getFormParserService(List<ElementParser> parsers);

  @override
  _FormProviderState createState() => _FormProviderState();
}

class _FormProviderState extends State<FormProvider> {
  FormManager _formManager;

  @override
  void initState() {
    super.initState();
    buildForm();
  }

  @override
  void didUpdateWidget(FormProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    buildForm();
  }

  void buildForm() {
    var formManagerBuilder = FormManagerBuilder(
      widget.getFormParserService(widget.parsers),
    );
    _formManager = formManagerBuilder.build(widget.formString);
  }

  @override
  Widget build(BuildContext context) {
    return FormData(
      child: widget.child,
      formManager: _formManager,
    );
  }
}
