import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/warning/snackbar.dart';
import 'package:noodle_timer/setting/settings.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String warningText;
  final int durationTime;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key, 
    required this.durationTime, 
    required this.onPressed, 
    required this.buttonText,
    required this.warningText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: myButtonBackgroundColor,
      onPressed: () {
        onPressed.call();
        SnackbarUtils.showCustomSnackbar(context, durationTime, warningText);
      },
      child: Text(buttonText),
    );
  }
}