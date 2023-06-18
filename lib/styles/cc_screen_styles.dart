import 'package:flutter/material.dart';

class CcScreenStyles {
  // App bar styles
  static const TextStyle appBarTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // Content padding
  static const EdgeInsetsGeometry contentPadding = EdgeInsets.all(16.0);

  // Question styles
  static const TextStyle questionTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const double questionSpacing = 16.0;
  static const TextStyle questionTextStyle = TextStyle(fontSize: 18);

  // Answer styles
  static const TextStyle answerTitleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const double answerSpacing = 100.0;
  static const double answerOptionSpacing = 8.0;

  // Answer colors
  static const Color correctAnswerColor = Colors.green;
  static const Color incorrectAnswerColor = Colors.red;
}
