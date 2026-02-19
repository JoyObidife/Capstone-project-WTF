import 'package:flutter/material.dart';

class MarketSellerDashboard extends StatelessWidget {
  const MarketSellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Market Seller Dashboard')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            Text('Welcome, Market Seller!', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
