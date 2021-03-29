import 'package:example/components/transition_form_element/transition_form_element_renderer.dart';
import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class TransitionFormContainer extends StatefulWidget {
  @override
  _TransitionFormContainerState createState() =>
      _TransitionFormContainerState();
}

class _TransitionFormContainerState extends State<TransitionFormContainer> {
  late FormRenderService _formRenderService;

  @override
  void initState() {
    super.initState();
    _formRenderService = FormRenderService(
      renderers: getRenderers()
        ..addAll([
          TransitionFormElementRenderer(),
        ]),
      dispatcher: BlocProvider.of<TransitionFormBloc>(context).add,
    );
    BlocProvider.of<TransitionFormBloc>(context).add(LoadFormEvent(1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransitionFormBloc, TransitionFormState>(
      builder: (context, state) {
        if (state.form == null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Center(
          child: SingleChildScrollView(
            child: _formRenderService.render(state.form!, context),
          ),
        );
      },
    );
  }
}
