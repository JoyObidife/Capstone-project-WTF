import 'package:flutter/material.dart';

class WhyThisRouteCard extends StatelessWidget {
  const WhyThisRouteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why This Route?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green.shade900,
            ),
          ),
          const SizedBox(height: 16),
          _buildReasonItem(
            '🌡️',
            'Temperature Control',
            'Reduced travel time helps maintain optimal temperature',
          ),
          const SizedBox(height: 16),
          _buildReasonItem(
            '🍅',
            'Freshness Window Extended by 12 Hours',
            'Preserve market value and reduce post-harvest\nlosses by ₦85,000',
          ),
          const SizedBox(height: 16),
          _buildReasonItem(
            '💰',
            'Fuel Efficiency',
            'Save ₦3,200 on fuel costs with optimized routing',
          ),
        ],
      ),
    );
  }

  Widget _buildReasonItem(String icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
