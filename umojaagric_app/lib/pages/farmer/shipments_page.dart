import 'package:flutter/material.dart';
import '../../widgets/shipment_card.dart';
import 'transporter_assigned_page.dart';

class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({super.key});

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  int _activeTab = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50, 
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
               SizedBox(height: 20),
              _buildActiveShipmentsCard(),
           SizedBox(height: 20),
              _buildTabs(),
           SizedBox(height: 20),
              _buildShipmentList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 16, color: Colors.green.shade900),
              SizedBox(width: 4),
                Text(
                  'Shipments',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Monitor all product deliveries in real-time',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green.shade800.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Icon(Icons.notifications_none_outlined, size: 28, color: Colors.green.shade900),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: BoxConstraints(
                  minWidth: 8,
                  minHeight: 8,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActiveShipmentsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade800, 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Active Shipments',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        SizedBox(height: 8),
         Text(
            '3 Routes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildStatusCount('1', 'In Transit'),
              SizedBox(width: 32),
              _buildStatusCount('1', 'Delivered'),
              SizedBox(width: 32),
              _buildStatusCount('2', 'Pending'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCount(String count, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style:  TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _buildTabItem(0, 'All Shipments'),
        const SizedBox(width: 12),
        _buildTabItem(1, 'Needs Transport (1)'),
      ],
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isActive = _activeTab == index;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = index),
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.green.shade600 : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildShipmentList() {
    return Column(
      children: [
        ShipmentCard(
          id: 'SH-2403',
          product: 'Cassava • 200 Bags',
          status: 'In Transit',
          statusColor: Colors.green.shade600,
          isVerified: true,
          carrier: 'Translog Nigeria',
          vehicle: 'Ventilated Truck',
          carrierReq: 'Root Vegetable Ventilation required',
          storageInfo: 'Medium Storage duration (2 days)',
          details: const {
            'Destination': 'Port Harcourt',
            'Driver': 'Ahmed Musa',
            'Distance': '420 km',
            'Driver\'s Phone No': '+234 803 456 7890',
            'Departure': 'March 18, 2026',
            'License Plate': 'LAG-485-FD',
            'Est. Arrival': 'March 20, 2026',
            'Rate': '₦85,000',
          },
        ),
         SizedBox(height: 20),
        ShipmentCard(
          id: 'SH-2402',
          product: 'Rice • 300 Bags',
          status: 'Delivered',
          statusColor: Colors.green.shade600,
          isVerified: false,
          vehicle: 'Standard Vehicle',
          carrierReq: 'Packaged grain, minimal special handling',
          storageInfo: 'Short duration (2 days)',
          details: const {
            'Destination': 'Port Harcourt',
            'Driver': 'Mary Eze',
            'Distance': '280 km',
            'Driver\'s Phone No': '+234 803 215 2240',
            'Departure': 'March  14, 2026',
            'License Plate': 'LAG-485-FD',
            'Est. Arrival': 'March 16, 2026',
            'Rate': '₦150,000',
          },
        ),
        SizedBox(height: 20),
        ShipmentCard(
          id: 'SH-2404',
          product: 'Tomatoes • 20 tons',
          status: 'Pending',
          statusColor: Colors.orange,
          isVerified: false,
          vehicle: 'Refrigerated Vehicle',
          carrierReq: 'Perishable produce needs cooling',
          storageInfo: 'Long distance, 2+ days transit',
          isHighPriority: true,
          details: const {
            'Destination': 'Kano Market',
            'Driver': 'Not Assigned',
            'Departure': 'March 19, 2026',
            'Est. Arrival': 'March 21, 2026',
            'Distance': '580 km',
          },
          showActionButton: true,
          onActionButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransporterAssignedPage()),
            );
          },
        ),
      ],
    );
  }
}
