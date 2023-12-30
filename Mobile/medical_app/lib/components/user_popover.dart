import 'package:flutter/material.dart';
import 'package:medical_app/screens/startup_screen.dart';
import 'package:medical_app/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class UserPopover extends StatelessWidget {
  const UserPopover({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(email),
          IconButton(
              onPressed: () {
                // Log out
                FirebaseAuthService.signOut();

                // Home page
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (ctx) => const StartScreen()),
                    (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
