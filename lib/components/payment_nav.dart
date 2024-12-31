import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PaymentNav extends StatelessWidget {
  Function(int)? onTabChange;

  PaymentNav({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
          color: Color.fromARGB(255, 26, 50, 99),
          activeColor: Colors.black,
          tabActiveBorder: Border.all(color: Colors.black),
          tabBackgroundColor: Colors.transparent,
          tabBorderRadius: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onTabChange: (value) => onTabChange!(value),
          tabs: const [
            GButton(
              icon: Icons.local_shipping,
              text: "Cash on delivery",
            ),
            GButton(
              icon: Icons.payment,
              text: "Online Payment",
            )
          ]),
    );
  }
}
