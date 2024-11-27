import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/pages/home_page.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 226, 219),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Logo
              Image.asset(
                'lib/images/Logo.png',
              ),

              //message
              const Text(
                "Empowering Every Athlete with Premium Jerseys to Conquer the Field in Style and Confidence!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 26, 50, 99),
                  decoration: TextDecoration.none,
                ),
              ),

              //shop now btn
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 26, 50, 99),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SHOP NOW',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 250, 185, 91),
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Icon(
                        Icons.shopping_bag,
                        size: 36,
                        color: Color.fromARGB(255, 250, 185, 91),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
