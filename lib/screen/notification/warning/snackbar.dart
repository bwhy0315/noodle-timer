import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SnackbarUtils {
  static void showCustomSnackbar(BuildContext context, int durationTime, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: text.text.size(16).white.make(),
        duration: Duration(seconds: durationTime),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
