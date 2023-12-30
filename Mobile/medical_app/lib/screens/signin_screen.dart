import 'package:flutter/material.dart';
import 'package:medical_app/components/app_button.dart';
import 'package:medical_app/components/form_bottom_links.dart';
import 'package:medical_app/components/form_field_container.dart';
import 'package:medical_app/screens/signup_screen.dart';
import 'package:medical_app/screens/user_screen.dart';
import 'package:medical_app/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import '../components/colors.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String email = '', password = '';
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: const Text(" "),
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Center(
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            const SizedBox(height: 80),
            FormFieldContainer(
              hintText: "Email",
              onSaved: (newValue) => email = newValue!,
              validator: (value) {
                return value!.isEmpty || !value.contains('@')
                    ? "Please enter valid email"
                    : null;
              },
            ),
            const SizedBox(height: 40),
            FormFieldContainer(
              hintText: "Password",
              isPasswordField: true,
              onSaved: (newValue) => password = newValue!,
              validator: (value) => value!.isEmpty ? "Enter a password" : null,
            ),
            const Spacer(),
            AppButton(
                label: "Log in",
                iconData: Icons.person,
                onPressed: () {
                  //Firebase login
                  if (_formKey.currentState!.validate()) {
                    //Save current form state
                    _formKey.currentState?.save();

                    FirebaseAuthService firebaseAuth = FirebaseAuthService();
                    firebaseAuth
                        .signInWithEmailAndPassword(email, password)
                        .then((user) {
                      if (user != null) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const UserScreen()),
                            (route) => false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Log in failed for user $email")));
                      }
                    });
                  } else // Validation fail
                  {}
                }),
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
      ),
    );
  }
}
