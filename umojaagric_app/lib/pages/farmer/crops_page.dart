import 'package:flutter/material.dart';
import '../../widgets/crop_card.dart';

class CropsPage extends StatelessWidget {
  const CropsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 24),
              _buildAddCropButton(),
            SizedBox(height: 32),
              Text(
                'Active Crops',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
               SizedBox(height: 16),
              CropCard(
                name: 'Maize',
                area: '5 Hectares',
                status: 'Vegetative',
                statusColor: Colors.green.shade700,
                plantedDate: 'Jan 15, 2026',
                expectedHarvest: 'May 2026',
                health: 0.85,
                healthText: '85%',
                healthColor: Colors.green.shade700,
              ),
             SizedBox(height: 16),
              CropCard(
                name: 'Rice',
                area: '3 Hectares',
                status: 'Germination',
                statusColor: Colors.teal.shade400,
                plantedDate: 'Feb 1, 2026',
                expectedHarvest: 'June 2026',
                health: 0.92,
                healthText: '92%',
                healthColor: Colors.green.shade700,
              ),
              SizedBox(height: 16),
              CropCard(
                name: 'Cassava',
                area: '2 Hectares',
                status: 'Maturity',
                statusColor: Colors.orange.shade600,
                plantedDate: 'Dec 10, 2025',
                expectedHarvest: 'Mar 2026',
                health: 0.78,
                healthText: '78%',
                healthColor: Colors.orange.shade400,
              ),
           SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios, color: Colors.green, size: 20),
            ),
             SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Management',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Monitor and manage your crops',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        Stack(
          children: [
             Icon(Icons.notifications_none, color: Colors.green, size: 28),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding:  EdgeInsets.all(4),
                decoration:  BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddCropButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade800, Colors.green.shade900],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.eco, color: Colors.white, size: 20),
              SizedBox(width: 12),
              Text(
                'Add New Crop',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


