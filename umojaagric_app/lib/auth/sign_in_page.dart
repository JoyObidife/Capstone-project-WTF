import 'package:flutter/material.dart';
import 'package:umojaagric_app/auth/sign_up_page.dart';
import 'package:umojaagric_app/dashboards/farmer_dashboard.dart';
import 'package:umojaagric_app/dashboards/market_seller_dashboard.dart';
import 'package:umojaagric_app/dashboards/transporter_dashboard.dart';
import 'package:umojaagric_app/widgets/custom_button.dart';
import 'package:umojaagric_app/widgets/custom_password_field.dart';
import 'package:umojaagric_app/widgets/custom_text_field.dart';
import 'package:umojaagric_app/utils/role_theme.dart';

class SignInPage extends StatefulWidget {
  final String role;

  const SignInPage({super.key, required this.role});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late RoleTheme _theme;

  @override
  void initState() {
    super.initState();
    _theme = RoleTheme.getTheme(widget.role);
  }

  void _handleSignIn() {
    Widget dashboard;
    switch (widget.role) {
      case 'farmer':
        dashboard = FarmerDashboard();
        break;
      case 'transporter':
        dashboard = TransporterDashboard();
        break;
      case 'market_seller':
        dashboard = MarketSellerDashboard();
        break;
      default:
        dashboard = FarmerDashboard();
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
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset('assets/images/product_image.png', height: 80),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: 'Email',
                  hintText: 'enter your email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                CustomPasswordField(
                  label: 'Password',
                  controller: _passwordController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: _theme.primaryColor,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 32),
                CustomButton(
                  label: 'Sign in',
                  onPressed: _handleSignIn,
                  color: _theme.primaryColor,
                ),
                const SizedBox(height: 24),
                Center(
                  child: Text(
                    'Or sign in with Google',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/google_icon.png',
                      height: 48,
                      width: 48,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(role: widget.role),
                        ),
                      ),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: _theme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
