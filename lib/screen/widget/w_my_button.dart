import 'package:flutter/material.dart';
import 'package:noodle_timer/main.dart';

class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key, 
    required this.text, 
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: myButtonBackgroundColor,
      child: Text(text),
    );
  }
}