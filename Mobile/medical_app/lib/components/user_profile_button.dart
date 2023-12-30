import 'package:flutter/material.dart';
import 'package:medical_app/components/user_popover.dart';
import 'package:popover/popover.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
          context: context,
          direction: PopoverDirection.bottom,
          height: 100,
          arrowHeight: 10,
          bodyBuilder: (context) =>
              const UserPopover(email: "isempe@email.com")),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/user-192.png")),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}
