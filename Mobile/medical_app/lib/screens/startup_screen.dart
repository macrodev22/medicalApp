import 'package:flutter/material.dart';
import 'package:medical_app/components/app_button.dart';
import 'package:medical_app/screens/lung_test.dart';
import 'package:medical_app/screens/signin_screen.dart';
import 'package:medical_app/screens/signup_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primary = Color.fromARGB(255, 0, 101, 251);
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topRight,
          child: Column(children: [
            const SizedBox(height: 80),
            const Text(
              "Transforming Healthcare",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/dna_PNG19.png"))),
            ),
            const Spacer(),
            AppButton(
              label: "Lung Test",
              iconData: Icons.medication,
              onPressed: () {
                // Go to lung test page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const LungTestScreen()));
              },
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  label: "Sign In",
                  iconData: Icons.arrow_drop_up,
                  onPressed: () {
                    // Go to signin page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => SigninScreen()));
                  },
                ),
                const SizedBox(width: 10),
                AppButton(
                  label: "Sign up",
                  iconData: Icons.app_registration,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SignupScreen()));
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
