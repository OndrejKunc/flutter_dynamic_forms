import 'package:example/renderers/check_box_renderer.dart';
import 'package:example/renderers/dropdown_button_renderer.dart';
import 'package:example/renderers/form_group_renderer.dart';
import 'package:example/renderers/form_renderer.dart';
import 'package:example/renderers/label_renderer.dart';
import 'package:example/renderers/radio_button_group_renderer.dart';
import 'package:example/renderers/radio_button_widget.dart';
import 'package:example/renderers/text_renderer.dart';
import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TransitionFormContainer extends StatefulWidget {
  @override
  _TransitionFormContainerState createState() =>
      _TransitionFormContainerState();
}

class _TransitionFormContainerState extends State<TransitionFormContainer> {
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
      dispatcher: BlocProvider.of<TransitionFormBloc>(context).dispatch,
    );
    BlocProvider.of<TransitionFormBloc>(context).dispatch(LoadFormEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormElementEvent, TransitionFormState>(
      bloc: BlocProvider.of<TransitionFormBloc>(context),
      builder: (context, state) {
        if (state.form == null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
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
