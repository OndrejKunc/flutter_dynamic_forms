import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_container.dart';
import 'package:example/transition_form/transition_form_event.dart';
import 'package:example/transition_form/transition_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';

class TransitionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: flutter.Text('Transition dynamic forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TransitionFormButtonRow(),
                TransitionFormContainer(),
              ],
            )),
      ),
    );
  }
}

class TransitionFormButtonRow extends StatelessWidget {
  const TransitionFormButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransitionFormBloc, TransitionFormState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<TransitionFormBloc>(context);
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton(
              borderSide: BorderSide(
                color: state.selectedForm == 1 ? Colors.blue : Colors.black12,
              ),
              child: Row(
                children: <Widget>[
                  flutter.Text('Form 1'),
                  SizedBox(width: 10),
                  Icon(
                    Icons.list,
                    color: Colors.red,
                  ),
                ],
              ),
              onPressed: () {
                BlocProvider.of<TransitionFormBloc>(context)
                    .add(LoadFormEvent(1));
              },
            ),
            SizedBox(width: 10),
            OutlineButton(
              borderSide: BorderSide(
                color: state.selectedForm == 2 ? Colors.blue : Colors.black12,
              ),
              child: Row(
                children: <Widget>[
                  flutter.Text('Form 2'),
                  SizedBox(width: 10),
                  Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                ],
              ),
              onPressed: () {
                bloc.add(LoadFormEvent(2));
              },
            ),
            SizedBox(width: 10),
            OutlineButton(
                borderSide: BorderSide(
                  color: state.selectedForm == 3 ? Colors.blue : Colors.black12,
                ),
                child: Row(
                  children: <Widget>[
                    flutter.Text('Form 3'),
                    SizedBox(width: 10),
                    Icon(
                      Icons.list,
                      color: Colors.green,
                    ),
                  ],
                ),
                onPressed: () {
                  bloc.add(LoadFormEvent(3));
                })
          ],
        );
      },
    );
  }
}
