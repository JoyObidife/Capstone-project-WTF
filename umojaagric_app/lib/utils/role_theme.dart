import 'package:flutter/material.dart';

class RoleTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final String backgroundImage;
  final String roleName;

  RoleTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.backgroundImage,
    required this.roleName,
  });

  static RoleTheme getTheme(String role) {
    Color orangePrimary = Colors.orange.shade800;
    Color lightBg = const Color(0xFFF2F5E9); // Light greenish-gray to match screenshot
    switch (role) {
      case 'farmer':
        return RoleTheme(
          primaryColor: orangePrimary,
          secondaryColor: Colors.white,
          backgroundColor: lightBg,
          backgroundImage: 'assets/images/onboarding_screen_3.jpeg',
          roleName: 'Farmer',
        );
      case 'transporter':
        return RoleTheme(
          primaryColor: orangePrimary,
          secondaryColor: Colors.white,
          backgroundColor: lightBg,
          backgroundImage: 'assets/images/onboarding_screen_3.jpeg',
          roleName: 'Transporter',
        );
      case 'market_seller':
        return RoleTheme(
          primaryColor: orangePrimary,
          secondaryColor: Colors.white,
          backgroundColor: lightBg,
          backgroundImage: 'assets/images/onboarding_screen_3.jpeg',
          roleName: 'Market Seller',
        );
      default:
        return RoleTheme(
          primaryColor: orangePrimary,
          secondaryColor: Colors.white,
          backgroundColor: Colors.white,
          backgroundImage: 'assets/images/login_image.jpeg',
          roleName: 'User',
        );
    }
  }
}
