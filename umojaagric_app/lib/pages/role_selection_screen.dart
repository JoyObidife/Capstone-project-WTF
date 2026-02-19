import 'package:flutter/material.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_image.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          
          // 2. Dark translucent overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.55), // Dark translucent overlay
            ),
          ),
          
          // 3. Foreground UI content
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // Header Section: Logo
                Center(
                  child: Image.asset(
                    'assets/images/product_image.png',
                    height: 100, // Medium-sized logo
                  ),
                ),
                
                const Spacer(),
                
                // Main Content Section: Role Selection Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15), // Soft semi-transparent background
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 1️⃣ Sign in as a Farmer (Primary CTA)
                        _buildRoleButton(
                          context: context,
                          text: 'Sign in as a Farmer',
                          onPressed: () {
                            // TODO: Navigate to Farmer Login Flow
                          },
                          backgroundColor: Colors.orange, // Bright orange
                          textColor: Colors.white,
                          isPrimary: true,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // 2️⃣ Sign in as a Transporter
                        _buildRoleButton(
                          context: context,
                          text: 'Sign in as a Transporter',
                          onPressed: () {
                            // TODO: Navigate to Transporter Login Flow
                          },
                          backgroundColor: Colors.white.withOpacity(0.9), // Light cream / off-white
                          textColor: Colors.orange,
                          borderColor: Colors.orange,
                          isPrimary: false,
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // 3️⃣ Sign in as a Market Seller
                        _buildRoleButton(
                          context: context,
                          text: 'Sign in as a Market Seller',
                          onPressed: () {
                            // TODO: Navigate to Market Seller Login Flow
                          },
                          backgroundColor: Colors.white.withOpacity(0.9),
                          textColor: Colors.orange,
                          borderColor: Colors.orange,
                          isPrimary: false,
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Footer Section
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            //color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    bool isPrimary = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: isPrimary ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 2)
                : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
