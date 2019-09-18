import 'package:expression_language/expression_language.dart';
import 'package:test/test.dart';

main() {
  test("delegate expression with single property", () {
    var testElement = TestElement(
      {
        "value": ConstantExpressionProvider<int>(14),
      },
    );
    var visitor = CloneExpressionVisitor(
      {"element1": testElement},
    );

    var delegateExpression = DelegateExpression(
        ["element1"], testElement.getExpressionProvider("value"));
    delegateExpression.accept(visitor);
    var resultExpression = visitor.result;
    expect(resultExpression, isA<DelegateExpression>());
    expect(resultExpression, isNot(delegateExpression));
    expect(resultExpression.evaluate(), 14);
  });

  test("delegate expression with parent property and explicit value", () {
    var testElement2 = TestElement(
      {
        "value": ConstantExpressionProvider<int>(14),
      },
    );
    var testElement1 = TestElement(
      {
        "parent": ConstantExpressionProvider<TestElement>(testElement2),
      },
    );
    var visitor = CloneExpressionVisitor(
      {
        "element1": testElement1,
        "element2": testElement2,
      },
    );

    var delegateExpression = DelegateExpression(["element1", "parent", "value"],
        testElement2.getExpressionProvider("value"));
    delegateExpression.accept(visitor);
    var resultExpression = visitor.result;
    expect(resultExpression, isA<DelegateExpression>());
    expect(resultExpression, isNot(delegateExpression));
    expect(resultExpression.evaluate(), 14);
  });

  test("delegate expression with parent property and default value", () {
    var testElement2 = TestElement(
      {
        "value": ConstantExpressionProvider<int>(14),
      },
    );
    var testElement1 = TestElement(
      {
        "parent": ConstantExpressionProvider<TestElement>(testElement2),
      },
    );
    var visitor = CloneExpressionVisitor(
      {
        "element1": testElement1,
        "element2": testElement2,
      },
    );

    var delegateExpression = DelegateExpression(
        ["element1", "parent"], testElement2.getExpressionProvider("value"));
    delegateExpression.accept(visitor);
    var resultExpression = visitor.result;
    expect(resultExpression, isA<DelegateExpression>());
    expect(resultExpression, isNot(delegateExpression));
    expect(resultExpression.evaluate(), 14);
  });
}

class TestElement extends ExpressionProviderElement {
  final Map<String, ExpressionProvider> properties;

  TestElement(this.properties);

  @override
  ExpressionProvider getExpressionProvider([String propertyName]) {
    if (propertyName == null || propertyName == "") {
      propertyName = "value";
    }
    return properties[propertyName];
  }

  @override
  ExpressionProviderElement clone(
      ExpressionProvider<ExpressionProviderElement> parent) {
    //Nothing to do
    return null;
  }
}

class ConstantExpressionProvider<T> extends ExpressionProvider<T> {
  final T value;

  ConstantExpressionProvider(this.value);

  @override
  Expression<T> getExpression() {
    return ConstantExpression(value);
  }
}
