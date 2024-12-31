import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/cart.dart';

class Reciept extends StatefulWidget {
  const Reciept({super.key});

  @override
  State<Reciept> createState() => _RecieptState();
}

class _RecieptState extends State<Reciept> {
  final double deliveryCharge = 100.00;

  // Calculate the total cost including delivery
  double calculateTotal() {
    double itemTotal = Cart.items.fold(
      0.0,
      (sum, item) => sum + (item["quantity"] * item["cloth"].price),
    );
    return itemTotal + deliveryCharge;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Receipt items list
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemBuilder: (context, index) {
                final cartItem = Cart.items[index];

                // Extracting values safely
                final cloth = cartItem["cloth"];
                final name = cloth?.name ?? "Unknown Jersey";
                final quantity = cartItem["quantity"] ?? 0;
                final price = cloth?.price ?? 0.0;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "x${quantity.toString()}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "\₹${(quantity * price).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: Cart.items.length,
            ),
          ),

          const Divider(thickness: 1),

          // Delivery charge row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Delivery Charge",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "\₹${deliveryCharge.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Total cost row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "\₹${calculateTotal().toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
