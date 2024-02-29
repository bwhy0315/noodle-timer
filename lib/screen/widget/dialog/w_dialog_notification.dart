import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationDialogWidget extends StatelessWidget {
  final Function() onPressed;
  const NotificationDialogWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: '알림 권한이 거부되었습니다.'.text.make(),
      content: '알림을 받으려면 앱 설정에서 권한을 허용해야 합니다.'.text.make(),
      actions: <Widget>[
        TextButton(
          child: '설정'.text.make(),
          onPressed: () {
            Navigator.pop(context);
            onPressed;
          },
        ),
        TextButton(
          child: '취소'.text.make(),
          onPressed: () => Navigator.pop(context)
        ),
      ],
    );
  }
}