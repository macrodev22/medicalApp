import 'package:flutter/material.dart';
import 'package:medical_app/components/app_button.dart';
import 'package:medical_app/components/colors.dart';
import 'package:medical_app/components/health_status_widget.dart';
import 'package:medical_app/components/organ_card.dart';
import 'package:medical_app/components/user_popover.dart';
import 'package:medical_app/components/user_profile_button.dart';
import 'package:medical_app/screens/lung_test.dart';
import 'package:medical_app/screens/startup_screen.dart';
import 'package:popover/popover.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // Map<IconData, String, String, bool>
  List<Map<String, dynamic>> organs = [
    {
      "icon": Icons.favorite_border,
      "organ": "Heart Rate",
      "status": "120 bpm",
      "active": true
    },
    {
      "icon": Icons.water_drop_outlined,
      "organ": "Blood status",
      "status": "80 - 90",
      "active": false
    },
    {
      "icon": Icons.bar_chart_outlined,
      "organ": "Blood count",
      "status": "120 bpm",
      "active": false
    },
    {
      "icon": Icons.table_rows_sharp,
      "organ": "Glucose level",
      "status": "9000/ml",
      "active": false
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 340,
              decoration: BoxDecoration(
                  color: grey,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  border: Border.all(color: Colors.white, width: 3)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const UserProfileButton(),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello"),
                            Text("Tom", style: TextStyle(fontSize: 22))
                          ],
                        ),
                        const Spacer(),
                        Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: grey,
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(Icons.notifications))
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text("How Are You", style: TextStyle(fontSize: 45)),
                    const Text("Feeling Today?",
                        style: TextStyle(fontSize: 45)),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        AppButton(
                            label: "Checkup",
                            iconData: Icons.health_and_safety_rounded,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          const LungTestScreen()));
                            }),
                        const Spacer(),
                        AppButton(
                            label: "Consult",
                            iconData: Icons.message_rounded,
                            onPressed: () {}),
                      ],
                    )
                  ]),
            ),
            //Main content
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 10),
                const Text("Your condition"),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => const StartScreen()));
                    },
                    child: const Text("Health")),
                const SizedBox(width: 10),
              ],
            ),
            //Bottom content
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              child: const Row(
                children: [
                  OrganCard(imagePath: "assets/lungs.jpg"),
                  Spacer(),
                  OrganCard(imagePath: "assets/heart-model.jpg"),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: organs.length,
                    itemBuilder: (ctx, index) {
                      return HealthStatus(
                          icon: organs[index]['icon'],
                          organ: organs[index]['organ'],
                          status: organs[index]['status'],
                          active: organs[index]['active']);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
