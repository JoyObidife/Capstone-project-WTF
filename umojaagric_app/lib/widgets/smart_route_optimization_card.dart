import 'package:flutter/material.dart';

class SmartRouteOptimizationCard extends StatelessWidget {
  const SmartRouteOptimizationCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.shade300, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.bolt, color: Colors.white, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smart Route Optimization',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'AI has analyzed real-time traffic conditions and identified a faster route that will help preserve your tomato freshness.',
                  style: TextStyle(color: Colors.brown.shade800, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
