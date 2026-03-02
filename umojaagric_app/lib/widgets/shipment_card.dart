import 'package:flutter/material.dart';
import 'custom_button.dart';

class ShipmentCard extends StatelessWidget {
  final String id;
  final String product;
  final String status;
  final Color statusColor;
  final bool isVerified;
  final String? carrier;
  final String vehicle;
  final String carrierReq;
  final String storageInfo;
  final bool isHighPriority;
  final Map<String, String> details;
  final bool showActionButton;
  final VoidCallback? onActionButtonPressed;

  const ShipmentCard({
    super.key,
    required this.id,
    required this.product,
    required this.status,
    required this.statusColor,
    required this.isVerified,
    this.carrier,
    required this.vehicle,
    required this.carrierReq,
    required this.storageInfo,
    this.isHighPriority = false,
    required this.details,
    this.showActionButton = false,
    this.onActionButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade100, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.local_shipping_outlined, color: Colors.green.shade700),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        id,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        product,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Carrier / Vehicle Card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isHighPriority ? Colors.blue : Colors.blueGrey.shade400, // Steel blue/grey
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isHighPriority ? Icons.ac_unit : (isVerified ? Icons.air : Icons.inventory_2_outlined),
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: isHighPriority ? 'Recommended: ' : (isVerified ? 'Verified Carrier-' : 'Recommended: '),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            TextSpan(
                              text: isHighPriority ? vehicle : (carrier ?? vehicle),
                              style: const TextStyle(color: Colors.white, fontSize: 13),
                            ),
                            if (!isHighPriority && isVerified)
                               TextSpan(
                                text: ' ($vehicle)',
                                style: const TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildCarrierDetailIcon(Icons.check_circle_outline, carrierReq),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildCarrierDetailIcon(Icons.check_circle_outline, storageInfo)),
                    if (isHighPriority)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'HIGH PRIORITY',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Details Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                runSpacing: 12,
                children: details.entries.map((e) {
                  return SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.key,
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          e.value,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
          if (showActionButton) ...[
            const SizedBox(height: 16),
            CustomButton(
              label: 'Select Transporter',
              onPressed: onActionButtonPressed ?? () {},
              color: Colors.green.shade600,
              textColor: Colors.white,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCarrierDetailIcon(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white70, size: 14),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
