import 'package:flutter/material.dart';

class NotificationDialogWidget extends StatelessWidget {

  final Function() onPressed;

  const NotificationDialogWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('알림 권한이 거부되었습니다.'),
      content: Text('알림을 받으려면 앱 설정에서 권한을 허용해야 합니다.'),
      actions: <Widget>[
        TextButton(
          child: Text('설정'),
          onPressed: () {
            Navigator.pop(context);
            onPressed;
          },
        ),
        TextButton(
          child: Text('취소'),
          onPressed: () => Navigator.pop(context)
        ),
      ],
    );
  }
}