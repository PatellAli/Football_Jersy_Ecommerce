import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/components/cart.dart';
import 'package:football_jersy_ecommerce/components/dropdown_size.dart';
import 'package:football_jersy_ecommerce/database/jersy.dart';
import 'package:football_jersy_ecommerce/database/jersy_database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DisplayPage extends StatefulWidget {
  final Jersy cloth;

  const DisplayPage({super.key, required this.cloth});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  final auth = AuthService();
  //size
  String? selectedSize;
  //quantity
  int quantity = 1;

  //increment
  void icrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  //decrement
  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  //cart handle
  void handleAddToCart() {
    final session = auth.getUser();

    if (session != null) {
      if (selectedSize == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select a size before adding to cart!')),
        );
        return;
      }
      int? id = widget.cloth.id;
      Cart.addToCart(
        widget.cloth,
        quantity,
        selectedSize!,
        id,
      );
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              '${widget.cloth.name} (Size: $selectedSize, Quantity: $quantity) added to cart!'),
        ),
      );
    } else {
      if (selectedSize == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You are not Logged in')),
        );
      }
    }
  }

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
              widget.cloth.image,
              height: 400,
            ),

            const Divider(
              thickness: 2,
            ),

            //description
            Text(
              widget.cloth.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            if (widget.cloth.inStock)
              DropdownSize(
                cloth: widget.cloth,
                onSizeSelected: (size) => selectedSize = size,
              ),

            const SizedBox(height: 10),

            //price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹' + widget.cloth.price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                Text(
                  widget.cloth.inStock ? 'In Stock' : 'Out of Stock',
                  style: TextStyle(
                    color: widget.cloth.inStock ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            //btn
            if (widget.cloth.inStock)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      handleAddToCart();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 26, 50, 99),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 25),
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
                  ),
                  Row(
                    children: [
                      //minus btn
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          onPressed: decrementQuantity,
                          icon: Icon(Icons.remove),
                        ),
                      ),

                      const SizedBox(width: 10),

                      //value

                      Text(
                        quantity.toString(),
                        style: TextStyle(fontSize: 30),
                      ),

                      const SizedBox(width: 10),

                      //add btn
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                          onPressed: icrementQuantity,
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            // add to cart button
          ],
        ),
      ),
    );
  }
}
