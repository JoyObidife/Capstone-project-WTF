import 'package:flutter/material.dart';
import 'alternative_route_page.dart';

class RoutesPage extends StatelessWidget {
  const RoutesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9), // Light green background (Colors.lightGreen.shade50)
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Routes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage and optimize your delivery routes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            
            // Summary Cards Row
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard('Total Distance', '752 km'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard('Est. Time', '11.5 hrs'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Route Card 1
            _buildRouteCard(
              title: 'Kaduna - Lagos Route',
              badgeText: 'Active',
              badgeColor: Colors.transparent,
              badgeTextColor: Colors.green[800]!,
              distance: '752 km',
              time: '11 hrs 30 min',
              trafficStatus: 'Moderate',
              trafficStatusColor: Colors.orange[700]!,
              trafficIcon: Icons.wb_cloudy_rounded, // Assuming cloud + sun equivalent
              tolls: '₦12,500',
              buttonText: 'Select Route',
              isOutlinedButton: true,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            
            // Route Card 2
            _buildRouteCard(
              title: 'Alternative Route via Abuja',
              badgeText: 'AI Pick',
              badgeColor: Colors.green[800]!,
              badgeTextColor: Colors.white,
              distance: '700 km',
              time: '09 hrs 45 min',
              trafficStatus: 'Light',
              trafficStatusColor: Colors.green[700]!,
              trafficIcon: null,
              tolls: '₦9,300',
              buttonText: 'Select AI Route',
              isOutlinedButton: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlternativeRoutePage()),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // A slightly deeper light green to match typical design shades
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2), // Gives a soft embossed feel if needed, or simple border
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard({
    required String title,
    required String badgeText,
    required Color badgeColor,
    required Color badgeTextColor,
    required String distance,
    required String time,
    required String trafficStatus,
    required Color trafficStatusColor,
    IconData? trafficIcon,
    required String tolls,
    required String buttonText,
    required bool isOutlinedButton,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade900.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Distance & Time Subtitle
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.green[700], size: 16),
              const SizedBox(width: 4),
              Text(
                '$distance  •  $time',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Details Grid Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Traffic Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Traffic Status',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                      if (trafficIcon != null) ...[
                        const SizedBox(width: 4),
                        Icon(trafficIcon, size: 14, color: Colors.green[700]),
                      ]
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trafficStatus,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: trafficStatusColor,
                    ),
                  ),
                ],
              ),
              // Total Tolls
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Tolls',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tolls,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8), // For spacing
            ],
          ),
          const SizedBox(height: 24),
          
          // Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: isOutlinedButton
                ? OutlinedButton(
                    onPressed: onPressed,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green[800]!, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
