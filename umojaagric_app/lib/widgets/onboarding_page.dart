import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final bool hasOverlay;

  const OnboardingPage({
    super.key,
    required this.child,
    this.backgroundImage,
    this.backgroundColor,
    this.backgroundGradient,
    this.hasOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Handled by Container
      body: Stack(
        children: [
          // Background Layer
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              gradient: backgroundGradient,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: AssetImage(backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          
          // Overlay Layer (for readability on images)
          if (hasOverlay)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.5), // Dark translucent overlay
            ),

          // Content Layer
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
