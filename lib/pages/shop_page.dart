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
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "TOP JERSYS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),

              const Divider(),

              // Hot Picks and See All Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'AC MILAN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              JersyTile(
                count: 2,
                Jersyname: "Ac Milan",
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Real Madrid',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              JersyTile(
                count: 2,
                Jersyname: "Real Madrid",
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Juventus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),

              JersyTile(
                count: 2,
                Jersyname: "Juventus",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
