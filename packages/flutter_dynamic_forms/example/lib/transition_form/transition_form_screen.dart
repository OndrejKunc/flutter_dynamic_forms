import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_container.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class TransitionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<TransitionFormBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: flutter.Text('Transition dynamic forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<FormElementEvent, TransitionFormState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  TransitionFormButtonRow(bloc, state),
                  TransitionFormContainer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class TransitionFormButtonRow extends StatelessWidget {
  final TransitionFormState state;
  final TransitionFormBloc bloc;

  const TransitionFormButtonRow(
    this.bloc,
    this.state, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Form 1"),
              SizedBox(width: 10),
              Icon(
                Icons.list,
                color: Colors.red,
              ),
            ],
          ),
          onPressed: () {
            bloc.dispatch(LoadFormEvent(1));
          },
        ),
        SizedBox(width: 10),
        OutlineButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Form 2"),
              SizedBox(width: 10),
              Icon(
                Icons.list,
                color: Colors.blue,
              ),
            ],
          ),
          onPressed: () {
            bloc.dispatch(LoadFormEvent(2));
          },
        ),
        SizedBox(width: 10),
        OutlineButton(
            child: Row(
              children: <Widget>[
                flutter.Text("Form 3"),
                SizedBox(width: 10),
                Icon(
                  Icons.list,
                  color: Colors.green,
                ),
              ],
            ),
            onPressed: () {
              bloc.dispatch(LoadFormEvent(3));
            })
      ],
    );
  }
}
