import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  //signIn function
  Future<AuthResponse?> signInWithEmailPassword(
      String email, String password) async {
    try {
      print("Auth service signIn");
      final res = await _supabase.auth
          .signInWithPassword(email: email, password: password);
      return res;
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  //signUp function
  Future<AuthResponse?> signUpWithEmailPassword(
      String email, String password) async {
    _supabase.auth.signUp(email: email, password: password);
  }

  //signOut function

  Future<void> signOut() async {
    try {
      await Supabase.instance.client.auth.signOut();
      print("User logged out successfully");
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  //Get current user
  String? getUser() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}
