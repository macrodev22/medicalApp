import 'package:flutter/material.dart';
import 'package:medical_app/components/colors.dart';

class HealthStatus extends StatelessWidget {
  const HealthStatus(
      {super.key,
      this.active = false,
      required this.icon,
      required this.organ,
      required this.status});
  final IconData icon;
  final String organ;
  final String status;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          //Icon
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: active ? primary : Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(icon,
                color: active ? Colors.white : Colors.black, size: 35),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(organ, style: const TextStyle(color: Colors.black)),
              Text(
                status,
                style: TextStyle(color: active ? primary : Colors.black),
              ),
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Text("👍🏼 Now",
                  style: TextStyle(color: active ? primary : Colors.black)))
        ],
      ),
    );
  }
}
