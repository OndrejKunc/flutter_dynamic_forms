import 'package:example/dynamic_form_bloc.dart';
import 'package:example/dynamic_form_event.dart';
import 'package:example/dynamic_form_state.dart';
import 'package:example/renderers/check_box_renderer.dart';
import 'package:example/renderers/dropdown_button_renderer.dart';
import 'package:example/renderers/form_group_renderer.dart';
import 'package:example/renderers/form_renderer.dart';
import 'package:example/renderers/label_renderer.dart';
import 'package:example/renderers/radio_button_group_renderer.dart';
import 'package:example/renderers/radio_button_widget.dart';
import 'package:example/renderers/text_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DynamicFormScreen extends StatefulWidget {
  @override
  _DynamicFormScreenState createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  FormRenderService _formRenderService;

  @override
  void initState() {
    super.initState();
    _formRenderService = FormRenderService(
      renderers: [
        FormRenderer(),
        FormGroupRenderer(),
        CheckBoxRenderer(),
        LabelRenderer(),
        TextRenderer(),
        RadioButtonGroupRenderer(),
        RadioButtonRenderer(),
        DropdownButtonRenderer()
      ],
      dispatcher: BlocProvider.of<DynamicFormBloc>(context).dispatch,
    );
    BlocProvider.of<DynamicFormBloc>(context).dispatch(LoadFormEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormElementEvent, DynamicFormState>(
      bloc: BlocProvider.of<DynamicFormBloc>(context),
      builder: (context, state) {
        if (state.form == null) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
          child: SingleChildScrollView(
            child: _formRenderService.render(state.form, context),
          ),
        );
      },
    );
  }
}
