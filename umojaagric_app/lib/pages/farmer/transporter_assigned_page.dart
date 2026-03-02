import 'package:flutter/material.dart';

class TransporterAssignedPage extends StatelessWidget {
  const TransporterAssignedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          SizedBox(height: 20),
            _buildSuccessHeader(),
           SizedBox(height: 20),
            _buildTransporterCard(),
          SizedBox(height: 20),
            _buildShipmentCard(),
         SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green.shade50, 
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
           SizedBox(height: 16),
          Container(
            padding:  EdgeInsets.all(12),
            decoration:  BoxDecoration(
              color: Colors.green, 
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.assignment_turned_in_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(height: 16),
        Text(
            'Transporter Selected',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
         SizedBox(height: 8),
           Text(
            'TransLog Nigeria has been assigned to SH-2403',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransporterCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50, 
        borderRadius:  BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: Icon(Icons.psychology_outlined, color: Colors.green.shade800, size: 30),
              ),
              SizedBox(width: 16),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TransLog Nigeria',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Verified Carrier',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              _buildDetailItem('Driver Name', 'Ahmed Musa'),
              _buildDetailItem('Vehicle Type', 'Ventilated Truck'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDetailItem('Phone Number', '+234 803 456 7890'),
              _buildDetailItem('License Plate', 'LAG-485-FD'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDetailItem('Rate', '₦85,000'),
              _buildDetailItem('ETA', '2 days'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShipmentCard() {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:  EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: Icon(Icons.psychology_outlined, color: Colors.green.shade800, size: 30),
              ),
               SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SH-2403',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Cassava • 200 Bags',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
             Spacer(),
              Container(
                padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green, 
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Text(
                  'In Transit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              _buildDetailItem('Destination', 'Port Harcourt'),
              _buildDetailItem('Departure', 'March 18, 2026'),
            ],
          ),
           SizedBox(height: 16),
          Row(
            children: [
              _buildDetailItem('Est. Arrival', 'March 20, 2026'),
              _buildDetailItem('Distance', '420 km'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
