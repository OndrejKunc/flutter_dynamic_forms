import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/dynamic_form/dynamic_form_bloc.dart';
import 'package:example/dynamic_form/dynamic_form_container.dart';
import 'package:example/dynamic_form/dynamic_form_event.dart';
import 'package:example/dynamic_form/dynamic_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

class DynamicFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DynamicFormBloc>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: BlocListener<FormElementEvent, DynamicFormState>(
            bloc: bloc,
            listener: (context, state) {
              if (state.resultItemValues != null &&
                  state.resultItemValues.isNotEmpty) {
                _displayDialog(context, state.resultItemValues);
              }
            },
            child: BlocBuilder<FormElementEvent, DynamicFormState>(
              bloc: bloc,
              builder: (context, state) {
                Column result = Column(children: <Widget>[
                  DynamicFormContainer(),
                ]);

                if (!state.isLoading) {
                  result.children.add(DynamicFormButtonRow(bloc, state));
                }
                return result;
              },
            ),
          ),
        ),
      ),
    );
  }

  void _displayDialog(
      BuildContext context, List<FormItemValue> resultItemValues) async {
    var bloc = BlocProvider.of<DynamicFormBloc>(context);
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: flutter.Text('Form data'),
            content: Container(
              width: double.maxFinite,
              height: 300.0,
              child: ListView(
                padding: EdgeInsets.all(8.0),
                //map List of our data to the ListView
                children: resultItemValues
                    .map((riv) => flutter.Text(
                        "${riv.name} ${riv.property} ${riv.value}"))
                    .toList(),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: flutter.Text('Ok'),
                onPressed: () {
                  bloc.dispatch(ClearFormDataEvent());
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

class DynamicFormButtonRow extends StatelessWidget {
  final DynamicFormState state;
  final DynamicFormBloc bloc;

  const DynamicFormButtonRow(
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
        OutlineButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Clear"),
              SizedBox(width: 10),
              Icon(Icons.clear_all, color: Colors.red),
            ],
          ),
          onPressed: () {
            bloc.dispatch(ClearFormEvent());
          },
        ),
        SizedBox(width: 10),
        OutlineButton(
          child: Row(
            children: <Widget>[
              flutter.Text("Ok"),
              SizedBox(width: 10),
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ],
          ),
          onPressed: state.isValid
              ? () {
                  bloc.dispatch(RequestFormDataEvent());
                }
              : null,
        )
      ],
    );
  }
}
