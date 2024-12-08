import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/jersy_tile.dart';
import 'package:football_jersy_ecommerce/database/jersy_database.dart';
import 'package:football_jersy_ecommerce/pages/all_jersy_page.dart';

import 'package:football_jersy_ecommerce/pages/display_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final db = JersyDatabase();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const SizedBox(height: 42),

          // Hot Picks and See All Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Hot Picks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ],
          ),

          JersyTile(
            count: 4,
          ),
        ],
      ),
    );
  }
}
