import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      backgroundColor: const Color.fromARGB(255, 232, 226, 219),
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Color.fromARGB(255, 250, 185, 91),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 50, 99),
        elevation: 4,
      ),
      body: Center(),
    );
  }
}
