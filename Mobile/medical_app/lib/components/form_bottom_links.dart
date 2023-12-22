import 'package:flutter/material.dart';

class FormBottomLinks extends StatelessWidget {
  const FormBottomLinks(
      {super.key,
      required this.questionText,
      required this.buttonText,
      required this.onPressed});
  final String questionText;
  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: const TextStyle(color: Colors.white),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.grey.shade200,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 20),
            ))
      ],
    );
  }
}
