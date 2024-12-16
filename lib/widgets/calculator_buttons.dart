import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorButtons extends StatelessWidget {
  final Function(String) onButtonPressed;

  CalculatorButtons({required this.onButtonPressed});

  final List<List<String>> _buttons = [
    ['AC', 'DEL', '%', '*'],
    ['1', '2', '3', '+'],
    ['4', '5', '6', '-'],
    ['7', '8', '9', '/'],
    ['00', '0', '.', '='],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: _buttons.expand((row) => row).length,
      itemBuilder: (context, index) {
        final String value = _buttons.expand((row) => row).toList()[index];
        return CalculatorButton(
          value: value,
          onTap: () => onButtonPressed(value),
        );
      },
    );
  }
}
