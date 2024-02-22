import 'package:flutter/material.dart';
import 'package:noodle_timer/setting/settings.dart';

class CreateTimerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateTimerButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: baseBackgroundColor,
      child: const Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}