import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/dropdown_size.dart';
import 'package:football_jersy_ecommerce/database/jersy.dart';
import 'package:football_jersy_ecommerce/database/jersy_database.dart';

class DisplayPage extends StatelessWidget {
  final Jersy cloth;
  const DisplayPage({super.key, required this.cloth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jersy Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            //Image

            Image.network(
              cloth.image,
              height: 400,
            ),

            const Divider(
              thickness: 2,
            ),

            //description
            Text(
              cloth.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            if (cloth.inStock) DropdownSize(cloth: cloth),

            const SizedBox(height: 20),

            //price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹' + cloth.price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                Text(
                  cloth.inStock ? 'In Stock' : 'Out of Stock',
                  style: TextStyle(
                    color: cloth.inStock ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            //btn
            if (cloth.inStock)
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 50, 99),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 232, 226, 219),
                    ),
                  ),
                ),
              ),
            // add to cart button
          ],
        ),
      ),
    );
  }
}
