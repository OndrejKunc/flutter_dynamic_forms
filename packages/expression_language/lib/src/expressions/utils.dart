import 'package:expression_language/src/number_type/decimal.dart';

Type getTypeOfNumberExpression(Type left, Type right) {
  if (left != right) {
    //One of them has to be decimal => whole expr is decimal
    return Decimal;
  }
  return left;
}
