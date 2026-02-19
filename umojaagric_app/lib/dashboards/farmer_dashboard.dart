import 'package:flutter/material.dart';
import '../pages/farmer/farmer_home_page.dart';
import '../pages/farmer/crops_page.dart';
import '../pages/farmer/shipments_page.dart';
import '../pages/farmer/finance_page.dart';

class FarmerDashboard extends StatefulWidget {
  const FarmerDashboard({super.key});

  @override
  State<FarmerDashboard> createState() => _FarmerDashboardState();
}

class _FarmerDashboardState extends State<FarmerDashboard> {
  int indexToBeShown = 0;

  final List<Widget> pages = [
     FarmerHomePage(),
     CropsPage(),
   ShipmentsPage(),
     FinancePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade50,
        currentIndex: indexToBeShown,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            indexToBeShown = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Crops",
            icon: Icon(Icons.agriculture, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Shipments",
            icon: Icon(Icons.local_shipping, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Finance",
            icon: Icon(Icons.account_balance_wallet, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
