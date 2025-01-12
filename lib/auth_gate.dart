import "package:flutter/material.dart";
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:auth2/screens/home/home_page.dart';
import 'package:auth2/screens/auth/sign_up.dart';
/*
AUTH GATE - listen for auth state changes.

unauthenticated -> Login page
authenticated   -> Home page
 */
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      // Listen to auth changes
        stream: Supabase.instance.client.auth.onAuthStateChange,

        // Build appropriate page based on auth state
        builder: (context, snapshot) {
          //loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          //check if there is a valid session currently
          final session = snapshot.hasData ? snapshot.data!.session : null;

          if (session != null) {
            return HomePage();
          } else {
            return SignUpPage();
          }
        }
    );
  }
}



