import 'package:flutter/material.dart';
import 'custom_button.dart';

class CustomPopup extends StatelessWidget {
  final String headline;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback onSecondaryButtonPressed;

  const CustomPopup({
    required this.headline,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onPrimaryButtonPressed,
    required this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        headline,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color.fromARGB(189, 202, 110, 241),
      actions: [
        CustomButton(
          onPressed: onPrimaryButtonPressed,
          text: primaryButtonText,
        ),
        const SizedBox(width: 8),
        CustomButton(
          onPressed: onSecondaryButtonPressed,
          text: secondaryButtonText,
        ),
      ],
    );
  }
}
