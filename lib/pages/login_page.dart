import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/pages/home_page.dart';
import 'package:football_jersy_ecommerce/pages/register_page.dart';
import 'package:football_jersy_ecommerce/pages/start_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //get auth service
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //login btn pressed
  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      final res = await authService.signInWithEmailPassword(email, password);
      if (res != null) {
        // Navigate to StartUpPage on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: login, child: Text('Login')),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ));
              },
              child: const Center(
                child: Text("Don't have an account?Sign"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
