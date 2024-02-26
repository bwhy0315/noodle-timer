import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showCustomSnackbar(BuildContext context, int durationTime, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: durationTime),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
