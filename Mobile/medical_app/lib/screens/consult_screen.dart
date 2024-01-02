import 'package:flutter/material.dart';
import 'package:medical_app/components/colors.dart';
import 'package:medical_app/user_auth/firebase_firestore_services.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key, required this.user});

  final CustomUser user;

  @override
  Widget build(BuildContext context) {
    var lungTests = user.lungTests;
    return Scaffold(
      backgroundColor: greyLight,
      appBar: AppBar(
        title: Text(user.displayName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            height: 310,
            width: 350,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/lungs.jpg')),
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(30)),
          ),
          const SizedBox(height: 10),
          const Text("Lung Condition", style: TextStyle(fontSize: 20)),
          Expanded(
              child: ListView.builder(
                  itemCount: lungTests.length,
                  itemBuilder: (context, index) {
                    double duration = lungTests[index]['duration'];
                    bool passed = lungTests[index]['passed'];
                    return LungTestResult(duration, passed);
                  }))
        ],
      ),
    );
  }
}

Widget LungTestResult(double duration, bool passed) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        const SizedBox(width: 10),
        Column(
          children: [
            const Text("Duration",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black)),
            Text(
              duration.toStringAsFixed(2),
              textAlign: TextAlign.left,
              style: const TextStyle(color: primary),
            ),
          ],
        ),
        const Spacer(),
        Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(100)),
            child: Text(passed ? "👍🏼 Passed" : "⚠️ Not passed",
                style: const TextStyle(color: Colors.black)))
      ],
    ),
  );
}
