import 'package:flutter/material.dart';
import '../screens/cc_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Complete'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CcScreen()),
            );
          },
          text: "Let's Get Started",
        ),
      ),
    );
  }
}
