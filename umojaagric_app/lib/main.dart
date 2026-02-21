import 'package:flutter/material.dart';
import 'package:umojaagric_app/pages/welcome_page.dart';
import 'package:umojaagric_app/screens/onboarding_screen.dart';
import 'package:umojaagric_app/widgets/onboarding_page.dart';

void main() {
  runApp(const UmojaAgriApp());
}

class UmojaAgriApp extends StatelessWidget {
  const UmojaAgriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UmojaAgri',
      theme: ThemeData(
        useMaterial3: true,
        
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange.shade800, 
          secondary: Colors.white, 
          onPrimary: Colors.white,
          onSecondary: Colors.orange.shade800,
        ),
       
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
