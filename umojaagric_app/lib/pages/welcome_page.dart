import 'package:flutter/material.dart';
import 'package:umojaagric_app/auth/sign_in_page.dart';
import 'package:umojaagric_app/auth/sign_up_page.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full-screen background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_image.jpeg',
              fit: BoxFit.cover,
            ),
          ),
         
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 60),
                 Image.asset(
                    'assets/images/product_image.png',
                    height: 120,
                  ),
                    
                   Spacer(),
                  // Role Selection Buttons
                  CustomButton(
                    label: 'Sign in as a Farmer',
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignInPage(role: 'farmer'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: 'Sign in as a Transporter',
                    color: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignInPage(role: 'transporter'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    label: 'Sign in as a Market Seller',
                    color: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.onSecondary,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignInPage(role: 'market_seller'),
                      ),
                    ),
                  ),
                   SizedBox(height: 32),
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  SignUpPage(role: 'farmer'),
                            ),
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
