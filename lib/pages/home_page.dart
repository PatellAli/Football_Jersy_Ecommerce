import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/bottom_nav_bar.dart';
import 'package:football_jersy_ecommerce/pages/about_page.dart';
import 'package:football_jersy_ecommerce/pages/all_jersy_page.dart';
import 'package:football_jersy_ecommerce/pages/cart_page.dart';
import 'package:football_jersy_ecommerce/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const AllJersyPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(255, 250, 185, 91),
            ),
          );
        }),
        title: const Text(
          "ELITE GEAR",
          style: TextStyle(
            color: Color.fromARGB(255, 250, 185, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 50, 99),
        elevation: 4,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 232, 226, 219),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                'lib/images/Logo.png',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('HOME'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPage(),
                      ));
                },
                child: const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('ABOUT'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('LOGOUT'),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
