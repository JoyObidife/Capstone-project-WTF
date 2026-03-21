import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'My Order',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.green[800]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          _buildIconBadge(Icons.shopping_cart_outlined, Colors.green[800]!),
          _buildIconBadge(Icons.notifications_none_outlined, Colors.green[800]!),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            Row(
              children: [
                Expanded(child: _buildSummaryCard('Active Orders', '3')),
                SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Total Value', '₦1,020,000')),
              ],
            ),
            SizedBox(height: 24),
            // Recent Orders Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Recent Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.filter_alt, size: 20, color: Colors.green[900]),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'View all',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Order List
            _buildOrderCard(
              productName: 'Fresh Tomatoes',
              status: 'Pending',
              orderId: 'ORD-2024-001',
              vendor: 'Lagos Fresh Mart',
              quantity: '150 kg',
              amount: '₦540,000',
              date: 'Feb 18, 2026',
            ),
            SizedBox(height: 12),
            _buildOrderCard(
              productName: 'Okra',
              status: 'Confirmed',
              orderId: 'ORD-2024-002',
              vendor: 'Ikeja Supermarket',
              quantity: '80 kg',
              amount: '₦160,000',
              date: 'Feb 17, 2026',
            ),
            SizedBox(height: 12),
            _buildOrderCard(
              productName: 'Sweet Corn',
              status: 'Confirmed',
              orderId: 'ORD-2024-003',
              vendor: 'Ikeja Supermarket',
              quantity: '40 kg',
              amount: '₦80,000',
              date: 'Feb 19, 2026',
            ),
        SizedBox(height: 12),
            _buildOrderCard(
              productName: 'Sweet Corn',
              status: 'In Transit',
              orderId: 'ORD-2024-004',
              vendor: 'Victoria Island Stores',
              quantity: '100 kg',
              amount: '₦120,000',
              date: 'Feb 16, 2026',
            ),
            SizedBox(height: 12),
            _buildOrderCard(
              productName: 'Onions',
              status: 'Delivered',
              orderId: 'ORD-2024-004',
              vendor: 'Ajah Market Center',
              quantity: '200 kg',
              amount: '₦200,000',
              date: 'Feb 15, 2026',
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBadge(IconData icon, Color iconColor) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: iconColor, size: 28),
          onPressed: () {},
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String productName,
    required String status,
    required String orderId,
    required String vendor,
    required String quantity,
    required String amount,
    required String date,
  }) {
    Color statusBgColor;
    Color statusTextColor;

    switch (status) {
      case 'Pending':
        statusBgColor = Colors.orange.shade50;
        statusTextColor = Colors.orange.shade800;
        break;
      case 'Confirmed':
      case 'In Transit':
        statusBgColor = Colors.green.shade50;
        statusTextColor = Colors.green.shade600;
        break;
      case 'Delivered':
        statusBgColor = Colors.grey.shade200;
        statusTextColor = Colors.grey.shade700;
        break;
      default:
        statusBgColor = Colors.grey.shade200;
        statusTextColor = Colors.black87;
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productName,
                style:TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            'Order ID: $orderId',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
           SizedBox(height: 2),
          Text(
            vendor,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 13,
            ),
          ),
          SizedBox(height: 12),
          Divider(color: Colors.grey[200]),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn('Quantity', quantity, Colors.black87),
              _buildInfoColumn('Amount', amount, Colors.orange.shade800),
              _buildInfoColumn('Date', date, Colors.grey[600]!, isValueBold: false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, Color valueColor, {bool isValueBold = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 14,
            fontWeight: isValueBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
