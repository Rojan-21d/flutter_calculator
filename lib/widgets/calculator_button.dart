import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final VoidCallback onTap;

  CalculatorButton({required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: _getButtonColor(value),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(String value) {
    if (value == 'AC' || value == 'DEL') return Colors.red;
    if (value == '=') return Colors.green;
    return Colors.grey[850]!;
  }
}
