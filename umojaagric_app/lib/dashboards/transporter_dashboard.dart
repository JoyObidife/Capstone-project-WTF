import 'package:flutter/material.dart';

class TransporterDashboard extends StatelessWidget {
  const TransporterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Transporter Dashboard')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, Transporter!', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
