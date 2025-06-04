import 'dart:math';


class WackyCalculator {
  String calculate(String expression) {
  try {
    // 30%の確率で無茶苦茶な結果を返す
    final rand = Random();
    if (rand.nextInt(100) < 30) {
      return _getRandomWeirdResult();
    }

    // 通常の計算（例: 数式評価用の関数がある場合）
   double _evaluateExpression(String expression) {
  Parser p = Parser();
  Expression exp = p.parse(expression);
  ContextModel cm = ContextModel();
  return exp.evaluate(EvaluationType.REAL, cm);
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
String _getRandomWeirdResult() {
  final weirdResults = [
    '42',
    '∞',
    '-999999',
    '3.14159265358979323846',
    'NaN（なにこれ）',
    'あなたの心の中に答えがある',
    'エラー404: 答えが見つかりません',
    '1000000年後に判明します',
    '√-1 = i（虚数！）',
    'ねこ',
  ];

  return weirdResults[Random().nextInt(weirdResults.length)];
}

}
