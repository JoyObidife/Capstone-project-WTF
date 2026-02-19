import 'package:flutter/material.dart';

class TransporterDashboard extends StatelessWidget {
  const TransporterDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transporter Dashboard')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.local_shipping, size: 100, color: Colors.blue),
            Text('Welcome, Transporter!', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
