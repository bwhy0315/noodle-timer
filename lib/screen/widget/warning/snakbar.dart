import 'package:flutter/material.dart';

class CustomSnackbarButtonWidget extends StatelessWidget {
  final String text;
  final int durationTime;
  final Function() onPressed;

  const CustomSnackbarButtonWidget({
    Key? key, 
    required this.durationTime, 
    required this.onPressed, 
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
        _showCustomSnackbar(context, durationTime);
      },
      child: Text(text),
    );
  }

  void _showCustomSnackbar(BuildContext context, int durationTime) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Tip!! 현재 페이지를 벗어나면 타이머가 초기화됩니다.",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
        duration: Duration(seconds: durationTime),
        backgroundColor: Colors.blue,
        action: SnackBarAction(
          label: '닫기',
          textColor: Colors.yellow,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
