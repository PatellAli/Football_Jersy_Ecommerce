import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/cart.dart';
import 'package:football_jersy_ecommerce/pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartItems = Cart.items;

  // Function to calculate the overall total
  int calculateCartTotal() {
    int total = 0;
    for (var item in cartItems) {
      int price = (item['cloth'].price as num).toInt(); // Ensure price is int
      int quantity =
          (item['quantity'] as num).toInt(); // Ensure quantity is int
      total += price * quantity; // Safe calculation
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return cartItems.isEmpty
        ? const Center(
            child: Text(
              "CART IS EMPTY",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        : Column(
            children: [
              // List of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    final cloth = product['cloth'];
                    final quantity = product['quantity'];
                    final size = product['size'];
                    int total = cloth.price * quantity;

                    return ListTile(
                      leading: Image.network(
                        cloth.image,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(cloth.name),
                      subtitle: Text(
                        "₹$total (Size: $size) (Quantity: $quantity)",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            Cart.removeFromCart(index);
                          });
                        },
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
              // Checkout section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL: ₹${calculateCartTotal()}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(),
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Proceed to Checkout")),
                        );
                      },
                      child: const Text("CHECKOUT"),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
