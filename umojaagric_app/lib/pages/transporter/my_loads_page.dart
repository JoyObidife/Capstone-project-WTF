import 'package:flutter/material.dart';

class MyLoadsPage extends StatelessWidget {
  const MyLoadsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Color primaryGreen = Colors.green.shade900;
    final Color lightBgGreen = Colors.green.shade50;
    final Color cardBgGreen = Colors.green.shade100;
    final Color warningBg = Colors.orange.shade50;

    return Scaffold(
      backgroundColor: lightBgGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(primaryGreen),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActiveShipmentHeader(primaryGreen),
                   SizedBox(height: 15),
                    _buildProduceInfo(),
                   SizedBox(height: 20),
                    _buildRouteCard(primaryGreen, cardBgGreen),
                    SizedBox(height: 20),
                    _buildAIRouteButton(primaryGreen),
                    SizedBox(height: 30),
                    _buildStatusUpdateSection(primaryGreen),
                    SizedBox(height: 30),
                    _buildTrafficWarningCard(warningBg),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color bgColor) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius:  BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.lightGreenAccent,
                child: Text(
                  'SK',
                  style: TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
               SizedBox(width: 15),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    'Sandra Kelvin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          _buildNotificationBadge(),
        ],
      ),
    );
  }

  Widget _buildNotificationBadge() {
    return Stack(
      children: [
       Icon(Icons.notifications, color: Colors.white, size: 28),
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
    );
  }

  Widget _buildActiveShipmentHeader(Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Active Shipment',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
       Text(
          'In Transit',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildProduceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Produce',
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('🍅', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(width: 15),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3 Tons of Tomatoes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Fresh Grade A',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRouteCard(Color primaryColor, Color bgColor) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildRouteStep(
            icon: Icons.radio_button_checked,
            iconColor: Colors.green.shade700,
            title: 'Pickup',
            location: 'Kaduna',
            subLocation: 'Sabon Gari Farm Complex',
            showLine: true,
          ),
          _buildRouteStep(
            icon: Icons.location_on,
            iconColor: primaryColor,
            title: 'Destination',
            location: 'Lagos',
            subLocation: 'Mile 12 International Market',
            eta: 'Estimated Time of Arrival: 2hrs',
            showLine: false,
          ),
        ],
      ),
    );
  }

  Widget _buildAIRouteButton(Color bgColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.near_me_outlined),
        label: Text('AI-Recommended Route'),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusUpdateSection(Color titleColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Update Shipment Status',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
       SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: titleColor),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              _buildStatusTab('At Farm', false, titleColor),
              _buildStatusTab('In transit', true, titleColor),
              _buildStatusTab('At the Market', false, titleColor),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrafficWarningCard(Color bgColor) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWarningIcon(),
         SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTrafficWarningHeader(),
               SizedBox(height: 5),
               Text(
                  '45min Traffic Delay detected on your current route.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Rerouting recommended to preserve tomato freshness and maintain optimal delivery temperature.',
                  style: TextStyle(
                    color: Colors.orange.shade800,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 15),
                _buildAlternativeRouteButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningIcon() {
    return Container(
      padding:  EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.error_outline, color: Colors.white, size: 24),
    );
  }

  Widget _buildTrafficWarningHeader() {
    return Row(
      children: [
        Text(
          'AI Traffic Prediction',
          style: TextStyle(
            color: Colors.orange.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
       SizedBox(width: 5),
        Icon(Icons.trending_up, color: Colors.red, size: 16),
      ],
    );
  }

  Widget _buildAlternativeRouteButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child:  Text('View Alternative Route'),
    );
  }

  Widget _buildRouteStep({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String location,
    required String subLocation,
    String? eta,
    required bool showLine,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: iconColor, size: 30),
            if (showLine)
              Container(
                width: 2,
                height: 50,
                color: Colors.grey.shade400,
              ),
          ],
        ),
       SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subLocation,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              if (eta != null) ...[
                SizedBox(height: 5),
                Text(
                  eta,
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusTab(String label, bool isActive, Color activeColor) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
