import 'package:flutter/material.dart';
import 'package:medical_app/components/app_button.dart';
import 'package:medical_app/components/colors.dart';
import 'package:medical_app/components/form_field_container.dart';
import 'package:medical_app/screens/signin_screen.dart';

import '../components/form_bottom_links.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
              "Register",
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
          const SizedBox(height: 40),
          const FormFieldContainer(
            hintText: "Username",
            isPasswordField: false,
          ),
          const Spacer(),
          AppButton(
              label: "Register", iconData: Icons.person, onPressed: () {}),
          // Foot functions
          const SizedBox(height: 20),
          FormBottomLinks(
            questionText: "Already have an account?",
            buttonText: "Log in",
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (ctx) => SigninScreen()),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}

//TextField

