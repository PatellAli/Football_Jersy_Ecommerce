import 'package:flutter/material.dart';
import 'package:football_jersy_ecommerce/auth/auth_service.dart';
import 'package:football_jersy_ecommerce/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //get auth service
  final authService = AuthService();

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  //signUp btn pressed
  void signUp() async {
    //prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password don't match")));
      return;
    }
    try {
      await authService.signUpWithEmailPassword(email, password);

      //pop register page
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERROR: $e'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
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
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: "Confirm Password"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: signUp, child: Text('SignUp')),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: const Center(
                child: Text("Already have an account? Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
