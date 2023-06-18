import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: colorScheme.secondary, // Set the background color of the button to the secondary color
        onPrimary: Colors.black, // Set the text color of the button to black
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
