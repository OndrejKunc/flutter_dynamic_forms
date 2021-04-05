import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:expression_language/expression_language.dart';

class ParsedFormProvider<T extends ParsedFormManager> extends StatelessWidget {
  final CreateFormManager<T> create;
  final String content;
  final List<FormElementParser<FormElement>> parsers;
  final List<FunctionExpressionFactory> expressionFactories;
  final Widget? child;
  final bool? lazy;

  const ParsedFormProvider({
    Key? key,
    required this.content,
    required this.parsers,
    required this.create,
    this.child,
    this.expressionFactories = const [],
    this.lazy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormProvider(
      create: (context) {
        T parsedFormProvider = this.create(context);
        parsedFormProvider.init(
          content: content,
          parsers: parsers,
          expressionFactories: expressionFactories,
        );
        return parsedFormProvider;
      },
      child: child,
      lazy: lazy,
    );
  }
}
