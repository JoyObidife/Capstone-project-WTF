import 'package:flutter/material.dart';
import '../pages/market_seller/market_seller_home_page.dart';
import '../pages/market_seller/my_orders_page.dart';
import '../pages/market_seller/finance_page.dart';
import '../pages/market_seller/cart_page.dart';

class MarketSellerDashboard extends StatefulWidget {
  const MarketSellerDashboard({super.key});

  @override
  State<MarketSellerDashboard> createState() => _MarketSellerDashboardState();
}

class _MarketSellerDashboardState extends State<MarketSellerDashboard> {
  int indexToBeShown = 0;

  final List<Widget> pages = [
    MarketSellerHomePage(),
    MyOrdersPage(),
    FinancePage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue.shade50,
        currentIndex: indexToBeShown,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade700,
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
            label: "My Orders",
            icon: Icon(Icons.receipt_long, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Finance",
            icon: Icon(Icons.account_balance_wallet, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
