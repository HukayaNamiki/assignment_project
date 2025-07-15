import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class WackyCalculator {
  final Random _random = Random();

  String calculate(String expression) {
    try {
      // 3回に1回「わかりましぇん」を返す
      if (_random.nextInt(3) == 0) {
        return 'わかりましぇん';
      }

      // 通常の計算
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      return result.toString();
    } catch (e) {
      return 'エラー';
    }
  }
}
