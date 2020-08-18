import 'package:example/bloc_dynamic_form/custom_form_manager.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_bloc.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_event.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class DynamicFormContainer extends StatefulWidget {
  @override
  _DynamicFormContainerState createState() => _DynamicFormContainerState();
}

class _DynamicFormContainerState extends State<DynamicFormContainer> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DynamicFormBloc>(context).add(LoadFormEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicFormBloc, DynamicFormState>(
      builder: (context, state) {
        if (state.form == null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Center(
          child: SingleChildScrollView(
              child: FormRenderer<CustomFormManager>(
            renderers: getReactiveRenderers(),
            dispatcher: BlocProvider.of<DynamicFormBloc>(context).add,
          )),
        );
      },
    );
  }
}
