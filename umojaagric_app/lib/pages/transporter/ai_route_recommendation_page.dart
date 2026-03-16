import 'package:flutter/material.dart';
import 'package:umojaagric_app/widgets/batch_profile_card.dart';
import 'package:umojaagric_app/widgets/smart_route_optimization_card.dart';
import 'package:umojaagric_app/widgets/dispatch_timing_card.dart';
import 'package:umojaagric_app/widgets/freshness_at_arrival_card.dart';
import 'package:umojaagric_app/widgets/route_comparison_card.dart';
import 'package:umojaagric_app/widgets/why_this_route_card.dart';
import 'package:umojaagric_app/widgets/bottom_action_buttons.dart';

class AiRouteRecommendationPage extends StatelessWidget {
  const AiRouteRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'AI Route Recommendation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            BatchProfileCard(),
            SizedBox(height: 16),
            SmartRouteOptimizationCard(),
            SizedBox(height: 16),
            DispatchTimingCard(),
            SizedBox(height: 16),
            FreshnessAtArrivalCard(),
            SizedBox(height: 16),
            RouteComparisonCard(),
            SizedBox(height: 16),
            WhyThisRouteCard(),
            SizedBox(height: 24),
            BottomActionButtons(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

