import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/components/cart.dart';
import 'package:football_jersy_ecommerce/components/reciept.dart';
import 'package:football_jersy_ecommerce/database/order.dart';
import 'package:football_jersy_ecommerce/database/order_database.dart';
import 'package:football_jersy_ecommerce/pages/checkout_page.dart';

class CashOnDelivery extends StatelessWidget {
  String address;
  String phoneNumber;

  CashOnDelivery({
    super.key,
    required this.address,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final orderDatabase = OrderDatabase();
    final authService = AuthService();
    return Column(
      children: [
        Reciept(),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            if (address == null || phoneNumber.length != 10 || address == "") {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please enter all of the credentials')),
              );
              return;
            } else {
              for (int i = 0; i < Cart.items.length; i++) {
                //create new order
                final item = Cart.items[i];
                final order = Order(
                  item_id: item['id'],
                  user: authService.getUser(),
                  quantity: item['quantity'],
                  address: address,
                  phone_number: phoneNumber,
                  size: item['size'],
                );

                orderDatabase.createOrder(order);
              }
              Cart.clearCart();
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Your Order is placed successfully!!"),
                  );
                },
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 26, 50, 99),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Text(
                "Order now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    //pay btn
  }
}
