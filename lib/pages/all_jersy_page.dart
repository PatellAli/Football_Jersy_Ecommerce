import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/jersy_tile.dart';
import 'package:football_jersy_ecommerce/components/jersy_tile_all.dart';
import 'package:football_jersy_ecommerce/components/search_bar_text.dart';
import 'package:football_jersy_ecommerce/pages/cart_page.dart';

class AllJersyPage extends StatefulWidget {
  const AllJersyPage({super.key});

  @override
  State<AllJersyPage> createState() => _AllJersyPageState();
}

class _AllJersyPageState extends State<AllJersyPage> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        children: [
          SearchBarText(
            onSearch: (query) {
              setState(() {
                searchQuery = query;
              });
            },
          ),
          const SizedBox(height: 40),
          JersyTileAll(
            searchQuery: searchQuery,
          ),
        ],
      ),
    );
  }
}
