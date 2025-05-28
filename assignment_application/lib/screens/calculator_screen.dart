import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '';

  // "無茶苦茶な"計算をするための関数（ランダム補正値を加える）
  String _calculate(String expression) {
    try {
      // 本来の簡易評価
      double actualResult = _simpleEvaluate(expression);
      double chaos = Random().nextDouble() * 10 - 5; // -5〜+5 の範囲でランダムな狂い
      double crazyResult = actualResult + chaos;
      return crazyResult.toStringAsFixed(2);
    } catch (e) {
      return 'エラー';
    }
  }

  // ごく単純な式評価（+ - * / のみに対応）
  double _simpleEvaluate(String expr) {
    List<String> tokens = expr.split(RegExp(r'([+\-*/])')).map((e) => e.trim()).toList();
    double result = double.tryParse(tokens[0]) ?? 0.0;
    for (int i = 1; i < tokens.length; i += 2) {
      String op = tokens[i];
      double next = double.tryParse(tokens[i + 1]) ?? 0.0;
      switch (op) {
        case '+':
          result += next;
          break;
        case '-':
          result -= next;
          break;
        case '*':
          result *= next;
          break;
        case '/':
          result /= next;
          break;
      }
    }
    return result;
  }

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        _result = _calculate(_input);
      } else {
        _input += value;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _onPressed(text),
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('無茶苦茶電卓')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(_input, style: TextStyle(fontSize: 32, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  Text(_result, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('/')]),
              Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('*')]),
              Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')]),
              Row(children: [_buildButton('0'), _buildButton('.'), _buildButton('='), _buildButton('+')]),
              Row(children: [_buildButton('C')]),
            ],
          )
        ],
      ),
    );
  }
}
