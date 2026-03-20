import 'package:flutter/material.dart';

class AiInsightCard extends StatelessWidget {
  const AiInsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50, 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.shade200, width: 2), // Outer border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.stacked_line_chart, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'AI Supply Insight ✨',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800, // Replaced hex code
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Supply drop expected next week due to Kaduna rains.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.brown.shade800, // Replaced hex code
            ),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 14,
                color: Colors.brown.shade800, // Replaced hex code
              ),
              children: const [
                TextSpan(
                  text: 'Stock up now ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'to maintain inventory levels.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
