import 'package:flutter/material.dart';
import '../pages/transporter/my_loads_page.dart';
import '../pages/transporter/routes_page.dart';
import '../pages/transporter/earnings_page.dart';
import '../pages/transporter/documents_page.dart';

class TransporterDashboard extends StatefulWidget {
  const TransporterDashboard({super.key});

  @override
  State<TransporterDashboard> createState() => _TransporterDashboardState();
}

class _TransporterDashboardState extends State<TransporterDashboard> {
  int indexToBeShown = 0;

  final List<Widget> pages = [
    const MyLoadsPage(),
    const RoutesPage(),
    const EarningsPage(),
    const DocumentsPage(),
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
            label: "My Loads",
            icon: Icon(Icons.local_shipping, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Routes",
            icon: Icon(Icons.route, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Earnings",
            icon: Icon(Icons.account_balance_wallet, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Documents",
            icon: Icon(Icons.description, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
