import 'package:flutter/material.dart';

class AnswerOptionWidget extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onPressed;

  const AnswerOptionWidget({
    required this.answerText,
    required this.isSelected,
    required this.isCorrect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.transparent;
    if (isSelected) {
      color = isCorrect ? Colors.green : Colors.red;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(answerText),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
