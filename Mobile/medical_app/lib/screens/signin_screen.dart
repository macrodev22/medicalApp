import 'package:flutter/material.dart';
import 'package:medical_app/components/app_button.dart';
import 'package:medical_app/components/form_bottom_links.dart';
import 'package:medical_app/components/form_field_container.dart';
import 'package:medical_app/screens/signup_screen.dart';
import '../components/colors.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: const Text(" "),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              "Sign in",
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          const SizedBox(height: 80),
          const FormFieldContainer(
            hintText: "Email",
          ),
          const SizedBox(height: 40),
          const FormFieldContainer(
            hintText: "Password",
            isPasswordField: true,
          ),
          const Spacer(),
          AppButton(label: "Log in", iconData: Icons.person, onPressed: () {}),
          // Foot functions
          const SizedBox(height: 20),
          FormBottomLinks(
            questionText: "Don't have an account yet?",
            buttonText: "Register",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (ctx) => const SignupScreen()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}
