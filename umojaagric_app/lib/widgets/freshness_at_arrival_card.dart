import 'package:flutter/material.dart';

class FreshnessAtArrivalCard extends StatelessWidget {
  const FreshnessAtArrivalCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Freshness at Arrival',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green.shade900,
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFreshnessIndicator(70, Colors.red, 'Current Route'),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Icon(Icons.arrow_forward, color: Colors.black87),
                    SizedBox(height: 4),
                    Text(
                      '+25%',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              _buildFreshnessIndicator(95, Colors.green, 'AI Route'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFreshnessIndicator(int percentage, Color color, String label) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(
                value: percentage / 100,
                strokeWidth: 8,
                backgroundColor: color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Text(
              '$percentage%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          label,
          style: TextStyle(fontSize: 13, color: Colors.black87),
        ),
      ],
    );
  }
}
