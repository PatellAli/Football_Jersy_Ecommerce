import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  Function(int)? onTabChange;
  BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: GNav(
        padding: EdgeInsets.all(14),
        color: Color.fromARGB(255, 26, 50, 99),
        activeColor: Color.fromARGB(255, 250, 185, 91),
        tabActiveBorder: Border.all(color: Colors.grey),
        tabBackgroundColor: Colors.white,
        tabBorderRadius: 12,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.list,
            text: 'Browrse',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
          GButton(
            icon: Icons.archive,
            text: 'Your Orders',
          ),
        ],
      ),
    );
  }
}
