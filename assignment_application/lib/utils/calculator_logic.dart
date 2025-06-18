import 'package:math_expressions/math_expressions.dart';

class WackyCalculator {
  String calculate(String expression) {
    try {
      double result = _evaluateExpression(expression);
      return result.toString();
    } catch (e) {
      return 'エラー';
    }
  }

  double _evaluateExpression(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }
}
