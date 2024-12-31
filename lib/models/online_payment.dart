import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/components/cart.dart';
import 'package:football_jersy_ecommerce/components/reciept.dart';
import 'package:football_jersy_ecommerce/database/order.dart';
import 'package:football_jersy_ecommerce/database/order_database.dart';

class OnlinePayment extends StatelessWidget {
  String address;
  String phoneNumber;
  OnlinePayment({
    super.key,
    required this.address,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final orderDatabase = OrderDatabase();
    final authService = AuthService();
    return Container(
      child: Column(
        children: [
          //Gpay, paytm
          const Text(
            "Pay with",
            style: TextStyle(color: Colors.grey),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //gpay
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'lib/images/gpay.png',
                    height: 40,
                  ),
                ),
              ),

              const Text(
                "or",
                style: TextStyle(color: Colors.grey),
              ),

              //paytm
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16),
                  child: Image.asset(
                    'lib/images/paytm.png',
                    height: 40,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Divider(),

          //reciept
          Column(
            children: [
              Reciept(),
              GestureDetector(
                onTap: () {
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
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 50, 99),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                    child: Text(
                      "Pay now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

          //pay btn
        ],
      ),
    );
  }
}
