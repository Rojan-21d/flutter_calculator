import 'package:flutter/material.dart';
import '../widgets/calculator_buttons.dart';
import '../utils/expression_evaluator.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _result = '0';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        _input = '';
        _result = '0';
      } else if (value == 'DEL') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = evaluateExpression(_input); // Using utility function
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Display Section
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    _result,
                    style: TextStyle(color: Colors.green, fontSize: 36),
                  ),
                ],
              ),
            ),
          ),
          // Button Grid
          Expanded(
            flex: 2,
            child: CalculatorButtons(onButtonPressed: _onButtonPressed),
          ),
        ],
      ),
    );
  }
}
