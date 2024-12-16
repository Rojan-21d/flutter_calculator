import 'package:math_expressions/math_expressions.dart';

String evaluateExpression(String expression) {
  try {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    return eval.toString();
  } catch (e) {
    return 'Error';
  }
}
