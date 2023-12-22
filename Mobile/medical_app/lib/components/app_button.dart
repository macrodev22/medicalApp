import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.iconData,
      required this.onPressed});
  final String label;
  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(iconData),
      onPressed: onPressed,
      label: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          label,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
