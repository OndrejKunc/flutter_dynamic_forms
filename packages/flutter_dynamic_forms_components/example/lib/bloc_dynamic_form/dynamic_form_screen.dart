import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_bloc.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_container.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_event.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';

class DynamicFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocListener<DynamicFormBloc, DynamicFormState>(
            listener: (context, state) {
              if (state.resultProperties.isNotEmpty) {
                _displayDialog(context, state.resultProperties);
              }
            },
            child: BlocBuilder<DynamicFormBloc, DynamicFormState>(
              builder: (context, state) {
                return Column(
                  children: [
                    DynamicFormContainer(),
                    if (!state.isLoading) DynamicFormButtonRow(state)
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _displayDialog(BuildContext context,
      List<FormPropertyValue> resultPropertyValues) async {
    var bloc = BlocProvider.of<DynamicFormBloc>(context);
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: flutter.Text('Form data'),
          content: flutter.Container(
            width: double.maxFinite,
            height: 300.0,
            child: ListView(
              padding: EdgeInsets.all(8.0),
              //map List of our data to the ListView
              children: resultPropertyValues
                  .map((riv) =>
                      flutter.Text('${riv.id} ${riv.property} ${riv.value}'))
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: flutter.Text('Ok'),
              onPressed: () {
                bloc.add(ClearFormDataEvent());
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

class DynamicFormButtonRow extends StatelessWidget {
  final DynamicFormState state;

  const DynamicFormButtonRow(
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DynamicFormBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Cancel"),
              SizedBox(width: 10),
              Icon(Icons.cancel, color: Colors.red),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 10),
        OutlinedButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Clear"),
              SizedBox(width: 10),
              Icon(Icons.clear_all, color: Colors.red),
            ],
          ),
          onPressed: () {
            bloc.add(ClearFormEvent());
          },
        ),
        SizedBox(width: 10),
        OutlinedButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Ok"),
              SizedBox(width: 10),
              Icon(
                Icons.check_circle,
                color: state.isValid ? Colors.green : Colors.black26,
              ),
            ],
          ),
          onPressed: state.isValid
              ? () {
                  bloc.add(RequestFormDataEvent());
                }
              : null,
        )
      ],
    );
  }
}
