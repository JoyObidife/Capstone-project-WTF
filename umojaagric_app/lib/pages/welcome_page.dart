import 'package:flutter/material.dart';
import 'package:umojaagric_app/auth/sign_in_page.dart';
import 'package:umojaagric_app/auth/sign_up_page.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _showSignUpRolePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding:  EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join UmojaAgri as...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.agriculture, color: Colors.orange.shade800),
              title: Text('Farmer'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(role: 'farmer')));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_shipping, color: Colors.orange.shade800),
              title: Text('Transporter'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(role: 'transporter')));
              },
            ),
            ListTile(
              leading: Icon(Icons.storefront, color: Colors.orange.shade800),
              title: Text('Market Seller'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(role: 'market_seller')));
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/login_image.jpeg',
              fit: BoxFit.cover,
            ),
          ),
         
       
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 60),
                 Image.asset(
                    'assets/images/product_image.png',
                    height: 120,
                  ),
                    
                   Spacer(),
                  Text(
                    'Select your role to continue',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  // Role Selection Buttons
                  CustomButton(
                    label: 'Sign in as a Farmer',
                    color: Colors.orange.shade800,
                    textColor: Colors.white,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignInPage(role: 'farmer'),
                      ),
                    ),
                  ),
                   SizedBox(height: 16),
                  CustomButton(
                    label: 'Sign in as a Transporter',
                    color: Colors.white,
                    textColor: Colors.orange.shade800,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignInPage(role: 'transporter'),
                      ),
                    ),
                  ),
                   SizedBox(height: 16),
                  CustomButton(
                    label: 'Sign in as a Market Seller',
                    color: Colors.white,
                    textColor: Colors.orange.shade800,
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
                        onTap: () => _showSignUpRolePicker(context),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
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
