import 'package:cc/styles/colors.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: colorScheme.copyWith(
          primary: AppColors.primaryColor , // Set the primary color to purple
          secondary: AppColors.secondaryColor, // Set the secondary color to yellow
      
        ),
         scaffoldBackgroundColor: AppColors.backgroundColor,
         appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 24,
             fontWeight: FontWeight.bold, color:AppColors.textColor), // Set the app bar text color
          ),
        fontFamily: 'Montserrat', // Use the 'Montserrat' font
      ),
      home: HomeScreen(),
    );
  }
}
