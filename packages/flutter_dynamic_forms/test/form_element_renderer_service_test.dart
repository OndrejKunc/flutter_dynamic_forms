import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('missing renderer test', (WidgetTester tester) async {
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          var formRendererService =
              FormRenderService(renderers: [], dispatcher: (_) {});
          var label = Label();
          expect(() => formRendererService.render(label, context),
              throwsA(isInstanceOf<MissingRendererException>()));

          // The builder function must return a widget.
          return Placeholder();
        },
      ),
    );
  });
}

class Label extends FormElement {
  static const String valuePropertyName = 'value';
  Property<String> get valueProperty =>
      properties[valuePropertyName] as Property<String>;
  set valueProperty(Property<String> value) =>
      registerProperty(valuePropertyName, value);
  String get value => valueProperty.value;
  @override
  FormElement getInstance() {
    return Label();
  }
}
