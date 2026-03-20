import 'package:flutter/material.dart';
import 'product_card.dart';

class FarmProduceSection extends StatelessWidget {
  const FarmProduceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Farm Produce',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900, // Replaced hex code
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('See All'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.62, // Taller cards to fit content without overflow
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final products = [
              {
                'image': 'assets/images/product_1.jpeg',
                'name': 'Tomatoes',
                'qty': '320kg',
                'price': '₦1,200/kg',
                'freshness': '92%',
                'farm': 'Swanta Farms',
              },
              {
                'image': 'assets/images/product_2.jpeg',
                'name': 'Sweet Corn',
                'qty': '320kg',
                'price': '₦1,200/kg',
                'freshness': '92%',
                'farm': 'Panwi Farm',
              },
              {
                'image': 'assets/images/product_3.jpeg',
                'name': 'Okro',
                'qty': '320kg',
                'price': '₦1,200/kg',
                'freshness': '92%',
                'farm': 'Swanta Farms',
              },
              {
                'image': 'assets/images/product_4.jpeg',
                'name': 'Palm Kernels',
                'qty': '320kg',
                'price': '₦1,200/kg',
                'freshness': '92%',
                'farm': 'Panwi Farm',
              },
            ];
            return ProductCard(
              imagePath: products[index]['image']!,
              name: products[index]['name']!,
              quantity: products[index]['qty']!,
              price: products[index]['price']!,
              freshness: products[index]['freshness']!,
              farmName: products[index]['farm']!,
            );
          },
        ),
      ],
    );
  }
}
