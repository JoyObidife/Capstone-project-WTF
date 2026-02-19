import 'package:flutter/material.dart';
import 'package:umojaagric_app/dashboards/farmer_dashboard.dart';
import 'package:umojaagric_app/dashboards/market_seller_dashboard.dart';
import 'package:umojaagric_app/dashboards/transporter_dashboard.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';
import 'package:umojaagric_app/widgets/custom_password_field.dart';
import 'package:umojaagric_app/widgets/custom_text_field.dart';
import 'package:umojaagric_app/utils/role_theme.dart';

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

  late RoleTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = RoleTheme.getTheme(widget.role);
  }

  void _handleSignUp() {
    Widget dashboard;
    switch (widget.role) {
      case 'farmer':
        dashboard =  FarmerDashboard();
        break;
      case 'transporter':
        dashboard =  TransporterDashboard();
        break;
      case 'market_seller':
        dashboard = MarketSellerDashboard();
        break;
      default:
        dashboard =  FarmerDashboard();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => dashboard),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/product_image.png', height: 80),
                ),
                 SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Register as ${widget.role.replaceAll('_', ' ')}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: 'Email',
                  hintText: 'enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomPasswordField(
                  label: 'Password',
                  controller: _passwordController,
                ),
               SizedBox(height: 16),
                CustomTextField(
                  label: 'Username',
                  hintText: '',
                  controller: _usernameController,
                ),
                 SizedBox(height: 16),
                Center(
                  child: Text(
                    'By continuing you agree to our Terms of Service and Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.black54, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(height: 40),
                CustomButton(
                  label: 'Sign up',
                  onPressed: _handleSignUp,
                  color: _theme.primaryColor,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: _theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
               SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
