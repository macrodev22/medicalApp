import 'package:flutter/material.dart';

class OrganCard extends StatelessWidget {
  const OrganCard({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePath)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Colors.white)),
    );
  }
}
