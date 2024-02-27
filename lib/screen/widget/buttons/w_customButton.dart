import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/warning/snackbar.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final String? warningText;
  final int durationTime;
  final VoidCallback onPressed;

  CustomButton({
    Key? key, 
    required this.durationTime, 
    required this.onPressed, 
    required this.buttonText,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.resolveWith<Color?>((states) {
          return buttonText == '일시정지' 
            ? Colors.red 
            : buttonText == '시작' 
              ? optionPerpleColor
              : buttonText == '저장' || buttonText == '취소' 
                ? const Color.fromARGB(255,253,202,140) 
                : Colors.grey[200];
        }),
        shape: buttonText == '저장' || buttonText == '취소' 
          ? MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: optionPerpleColor, width: 2)
              ),
            )
          : null
      ),
      onPressed: () {
        onPressed.call();
        if(warningText != null && durationTime != 0) {
          SnackbarUtils.showCustomSnackbar(context, durationTime, warningText!);
        }
      },
      child: buttonText.text.textStyle(
        TextStyle( 
          color: buttonText == '다시시작' 
            ? Colors.black 
            : buttonText == '저장' || buttonText == '취소'
              ? Colors.black
              : Colors.white
        )
      ).size(20).make().pOnly(
        left: buttonText != '시작' ? 10 : 20 ,
        right: buttonText != '시작' ? 10 : 20
      ),
    );
  }
}