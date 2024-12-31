import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:football_jersy_ecommerce/pages/login_page.dart';
import 'package:football_jersy_ecommerce/pages/start_up_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // Debugging
        print("StreamBuilder snapshot: ${snapshot.data}");
        print(
            "Current session: ${Supabase.instance.client.auth.currentSession}");

        // Show loading indicator while waiting for stream data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Check the session
        final session = Supabase.instance.client.auth.currentSession;
        if (session != null) {
          print("AuthGate: Redirecting to StartUpPage.");
          return const StartUpPage();
        } else {
          print("AuthGate:Not Redirecting to StartUpPage.");
          return const LoginPage();
        }
      },
    );
  }
}
