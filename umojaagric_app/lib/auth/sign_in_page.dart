import 'package:flutter/material.dart';
import 'package:umojaagric_app/auth/sign_up_page.dart';
import 'package:umojaagric_app/dashboards/farmer_dashboard.dart';
import 'package:umojaagric_app/dashboards/market_seller_dashboard.dart';
import 'package:umojaagric_app/dashboards/transporter_dashboard.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';
import 'package:umojaagric_app/widgets/custom_password_field.dart';
import 'package:umojaagric_app/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  final String role;

  const SignInPage({super.key, required this.role});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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

  void _handleSignIn() {
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
              const SizedBox(height: 20),
              const Text('Sign in', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Sign in as $_roleTitle', style: const TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 40),
              CustomTextField(hintText: 'Email', controller: _emailController, keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              CustomPasswordField(controller: _passwordController),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Forgot password?')),
              ),
              const SizedBox(height: 24),
              CustomButton(label: 'Sign in', onPressed: _handleSignIn),
              const SizedBox(height: 32),
              const Text('Or sign in with Google', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  // Mock Google login
                },
                child: Image.asset(
                  'assets/images/google_icon.png',
                  height: 48,
                  width: 48,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(role: widget.role))),
                    child: Text('Sign up', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
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
