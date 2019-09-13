import 'package:dynamic_forms/dynamic_forms.dart' as forms;
import 'package:example/form_parser_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;
import 'package:flutter/material.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_bloc.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_screen.dart';
import 'package:example/simple_form/simple_form_screen.dart';
import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_builder.dart';
import 'package:example/transition_form/transition_form_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimpleFormScreen(
                      formParserType: FormParserType.xml,
                    ),
                  ),
                );
              },
              child: Text("Simple XML Form"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleFormScreen(
                        formParserType: FormParserType.json,
                      ),
                    ),
                  );
                },
                child: Text("Simple JSON Form"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        builder: (context) {
                          return DynamicFormBloc(
                            forms.FormManagerBuilder(
                              forms.XmlFormParserService(
                                components.getDefaultParserList(),
                              ),
                            ),
                          );
                        },
                        child: DynamicFormScreen(),
                      ),
                    ),
                  );
                },
                child: Text("Dynamic Form With Bloc"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  var formManagerBuilder = forms.FormManagerBuilder(
                    forms.XmlFormParserService(
                      components.getDefaultParserList(),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        builder: (context) {
                          return TransitionFormBloc(
                            formManagerBuilder,
                            TransitionFormBuilder(formManagerBuilder),
                          );
                        },
                        child: TransitionFormScreen(),
                      ),
                    ),
                  );
                },
                child: Text("Transition Dynamic Form"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
