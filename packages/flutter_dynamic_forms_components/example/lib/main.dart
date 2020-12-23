import 'package:example/advanced_expression_form/advanced_expression_form.dart';
import 'package:example/custom_expression_form/custom_expression_form.dart';
import 'package:example/simple_submit_form/simple_submit_form.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:example/simple_form/simple_form_xml.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart'
    as components;
import 'package:flutter/material.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_bloc.dart';
import 'package:example/bloc_dynamic_form/dynamic_form_screen.dart';
import 'package:example/simple_form/simple_form_json.dart';
import 'package:example/transition_form/transition_form_bloc.dart';
import 'package:example/transition_form/transition_form_builder.dart';
import 'package:example/transition_form/transition_form_screen.dart';

import 'bloc_dynamic_form/custom_form_manager.dart';

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
                    builder: (context) => SimpleFormXml(),
                  ),
                );
              },
              child: Text('Simple XML Form'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleFormJson(),
                    ),
                  );
                },
                child: Text('Simple JSON Form'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SimpleSubmitForm(),
                    ),
                  );
                },
                child: Text('Simple Submit Form'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomExpressionForm(),
                    ),
                  );
                },
                child: Text('Custom Expression Form'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdvancedExpressionForm(),
                    ),
                  );
                },
                child: Text('Advanced Expression Form'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FormProvider(
                        create: (_) => CustomFormManager(),
                        child: BlocProvider(
                          create: (context) {
                            return DynamicFormBloc(
                                FormProvider.of<CustomFormManager>(context));
                          },
                          child: DynamicFormScreen(),
                        ),
                      ),
                    ),
                  );
                },
                child: Text('Dynamic Form With Bloc'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RaisedButton(
                onPressed: () {
                  var formBuilder = FormBuilder(
                    XmlFormParserService(
                      components.getDefaultParserList(),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) {
                          return TransitionFormBloc(
                            formBuilder,
                            TransitionFormBuilder(formBuilder),
                          );
                        },
                        child: TransitionFormScreen(),
                      ),
                    ),
                  );
                },
                child: Text('Transition Dynamic Form'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
