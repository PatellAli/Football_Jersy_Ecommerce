import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/components/payment_nav.dart';
import 'package:football_jersy_ecommerce/models/cash_on_delivery.dart';
import 'package:football_jersy_ecommerce/models/online_payment.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final authService = AuthService();

  @override
  void initState() {
    super.initState();
    final userEmail = authService.getUser();
    emailController.text = userEmail ?? "";
  }

  //text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  int selectedIndex = 0;

  void navigatePayment(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<Widget> _payment = [
    //   CashOnDelivery(
    //     address: addressController.text,
    //     phoneNumber: phoneNumberController.text,
    //   ),
    //   const OnlinePayment(),
    // ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("CHECKOUT"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 16),

                //email
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: UnderlineInputBorder(),
                  ),
                  controller: emailController,
                ),

                const SizedBox(height: 16),

                //phone number
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: UnderlineInputBorder(),
                  ),
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 10,
                ),

                const SizedBox(height: 16),

                //Address
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(),
                  ),
                  controller: addressController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                ),

                const SizedBox(height: 16),

                //payment method
                PaymentNav(
                  onTabChange: (index) => navigatePayment(index),
                ),
                const SizedBox(height: 16),

                Container(
                  child: selectedIndex == 0
                      ? CashOnDelivery(
                          address: addressController.text,
                          phoneNumber: phoneNumberController.text,
                        )
                      : OnlinePayment(
                          address: addressController.text,
                          phoneNumber: phoneNumberController.text),
                ),
              ],
            ),
          ),
        ));
  }
}
