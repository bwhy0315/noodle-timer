import 'package:flutter/material.dart';
import 'package:noodle_timer/setting/settings.dart';

class SnackbarUtils {
  static void showCustomSnackbar(BuildContext context, int durationTime, [String? text]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? '',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: durationTime),
        backgroundColor: Colors.blue,
        action: SnackBarAction(
          label: '닫기',
          textColor: baseBackgroundColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
