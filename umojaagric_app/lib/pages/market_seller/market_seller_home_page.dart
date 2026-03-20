import 'package:flutter/material.dart';
import 'widgets/header_section.dart';
import 'widgets/ai_insight_card.dart';
import 'widgets/incoming_deliveries_section.dart';
import 'widgets/farm_produce_section.dart';

class MarketSellerHomePage extends StatelessWidget {
  const MarketSellerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderSection(),
              SizedBox(height: 24),
              AiInsightCard(),
              SizedBox(height: 24),
              IncomingDeliveriesSection(),
              SizedBox(height: 24),
              FarmProduceSection(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
