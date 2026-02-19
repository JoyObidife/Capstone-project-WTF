import 'package:flutter/material.dart';
import 'package:umojaagric_app/auth/welcome_page.dart';

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
        // Using standard Flutter colors instead of hex codes
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.orange.shade800, // Primary for main actions (Orange)
          secondary: Colors.orange.shade100, // Secondary for backgrounds (Creamy)
          onPrimary: Colors.white,
          onSecondary: Colors.orange.shade800,
        ),
        // Global button styling
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
