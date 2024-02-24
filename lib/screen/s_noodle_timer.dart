import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/notification/notification_service.dart';
import 'package:noodle_timer/screen/box_sized/container.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/dialog/w_dialog_notification.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:noodle_timer/screen/widget/warning/snakbar.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';


class TimerPage extends StatefulWidget {
  final String ramenName;
  final int cookTime;

  const TimerPage({
    Key? key, 
    required this.ramenName, 
    required this.cookTime
  }) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late int _targetNumber = 0;
  Timer? _timer;
  bool isStart = false;

  @override
  void initState() {
    super.initState();
    _targetNumber = widget.cookTime;
    _requestNotificationPermissions();
  }

  void _requestNotificationPermissions() async {
    if (await NotificationService().requestNotificationPermissions().isDenied && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => 
            NotificationDialogWidget(onPressed: openAppSettings,)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_targetNumber / widget.cookTime).clamp(0.0, 1.0);

    return Scaffold(
      appBar: const MyAppBar(titleName: '타이머'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.ramenName}'),
            Stack(
              children: [
                Positioned(
                  top: 90,left: 35,
                  child: Text(
                    '${formatTime(_targetNumber)}',
                    style: TextStyle(
                      fontSize: 80
                    ),
                  )
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // 원형 모양
                    border: Border.all(color: Colors.black, width: 1.0), // 테두리 속성
                  ),
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 16,
                    color: baseBackgroundColor,
                  ),
                ),
              ],
            ).pSymmetric(v: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(isStart)
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Text('다시시작'),
                  )
                else
                  height10,
                  CustomSnackbarButtonWidget(
                    onPressed: _toggleTimer,
                    text:isStart ? '정지' : '시작', 
                    durationTime: _targetNumber
                  ),
              ],
            ).p(10),
          ],
        ),
      ),
    );
  }

  void _resetCounter() {
    setState(() {
      _targetNumber = widget.cookTime;
        isStart = !isStart;
      _stopTimer();
    });
  }

  void _toggleTimer() {
    setState(() {
      isStart = !isStart;
    });
    if (_timer?.isActive == true) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _targetNumber--;
        if (_targetNumber == 0) {
          _targetNumber = _targetNumber;
          NotificationService().showNotification(widget.ramenName);
          _stopTimer();
          _resetCounter();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }
}
