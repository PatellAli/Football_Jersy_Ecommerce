import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ABOUT US',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 50, 99),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 232, 226, 219),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Image.asset(
                'lib/images/Logo.png',
                height: 230,
              ),

              //who we are
              const Text(
                'Who We Are: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const Text(
                "Elite Gear provides high-quality products for sports and adventure enthusiasts, built on innovation, performance, and customer satisfaction. ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 18),

              //Our mission

              const Text(
                'Our Mission: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const Text(
                "We aim to exceed expectations by offering reliable gear that empowers individuals to face any challenge confidently.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 18),

              const Text(
                'Quality and Innovation: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const Text(
                "We deliver durable gear crafted with cutting-edge materials, designed for peak performance.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
