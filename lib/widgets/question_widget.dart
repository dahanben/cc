import 'package:flutter/material.dart';

import '../styles/colors.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;

  const QuestionWidget({required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          questionText,
          style: const TextStyle(fontSize: 24, color: AppColors.textColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 8),
      ],
    );
  }
}
