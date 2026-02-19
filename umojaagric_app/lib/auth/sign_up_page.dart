import 'package:flutter/material.dart';
import 'package:umojaagric_app/dashboards/farmer_dashboard.dart';
import 'package:umojaagric_app/dashboards/market_seller_dashboard.dart';
import 'package:umojaagric_app/dashboards/transporter_dashboard.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';
import 'package:umojaagric_app/widgets/custom_password_field.dart';
import 'package:umojaagric_app/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  final String role;

  const SignUpPage({super.key, required this.role});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get _roleTitle {
    switch (widget.role) {
      case 'farmer':
        return 'Farmer';
      case 'transporter':
        return 'Transporter';
      case 'market_seller':
        return 'Market Seller';
      default:
        return 'User';
    }
  }

  void _handleSignUp() {
    Widget dashboard;
    switch (widget.role) {
      case 'farmer':
        dashboard = const FarmerDashboard();
        break;
      case 'transporter':
        dashboard = const TransporterDashboard();
        break;
      case 'market_seller':
        dashboard = const MarketSellerDashboard();
        break;
      default:
        dashboard = const FarmerDashboard();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => dashboard),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Image.asset('assets/images/product_image.png', height: 80),
               SizedBox(height: 20),
               Text('Sign up', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
             SizedBox(height: 8),
              Text('Create an account as $_roleTitle', style: TextStyle(fontSize: 16, color: Colors.grey)),
             SizedBox(height: 40),
              CustomTextField(
                hintText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                controller: _passwordController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Username',
                controller: _usernameController,
              ),
               SizedBox(height: 24),
               Text(
                'By continuing you agree to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              CustomButton(label: 'Sign up', onPressed: _handleSignUp),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text('Sign in', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
