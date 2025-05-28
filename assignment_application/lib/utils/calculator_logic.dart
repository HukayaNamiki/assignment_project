import 'dart:math';

class WackyCalculator {
  static String calculate(String expression) {
    // 正しい答えではなく、わざと変な答えを返す
    try {
      // 意図的に表現を一部変更する（例: 数字をランダムに変換）
      String modifiedExpression = _distortExpression(expression);
      double fakeResult = _fakeEvaluate(modifiedExpression);
      return fakeResult.toStringAsFixed(2);
    } catch (e) {
      return '??';
    }
  }

  static String _distortExpression(String expression) {
    // 数字を少しだけ改変する
    return expression.replaceAllMapped(RegExp(r'\d+'), (match) {
      int original = int.parse(match.group(0)!);
      int offset = Random().nextInt(3) - 1; // -1, 0, or +1
      return (original + offset).toString();
    });
  }

  static double _fakeEvaluate(String expr) {
    // 本当のパースはせず、適当な計算結果を返す
    return Random().nextDouble() * 100 - 50; // -50 ～ +50の間のランダムな数
  }
}
