import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/box_sized/container.dart';
import 'package:noodle_timer/screen/notification/notification_service.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/buttons/w_customButton.dart';
import 'package:noodle_timer/screen/widget/dialog/w_dialog_notification.dart';
import 'package:noodle_timer/screen/widget/format.dart';
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
    RequestNotification.requestNotificationPermissions(context);
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_targetNumber / widget.cookTime).clamp(0.0, 1.0);

    return Scaffold(
      appBar: const MyAppBar(titleName: '누들 타이머'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.ramenName),
            Stack(
              children: [
                Positioned(
                  top:  calculateSizeValue(context, 60, 90),
                  left: calculateSizeValue(context, 105, 40),
                  child: Text(
                    formatTime(_targetNumber),
                    style: TextStyle(
                      fontSize: calculateSizeValue(context, 55, 80)
                    ),
                  )
                ),
                SizedBox(
                  width: calculateSizeValue(context, 220, 300),
                  height: calculateSizeValue(context, 220, 300),
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: calculateSizeValue(context, 10, 16),
                    color: baseBackgroundColor,
                  ),
                ).pOnly(
                  left: calculateSizeValue(context, 75, 0), 
                  bottom: calculateSizeValue(context, 50, 0)
                ),
              ],
            ).pOnly(right: calculateSizeValue(context, 200, 0)),
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
                  CustomButton(
                    onPressed: _toggleTimer,
                    buttonText: isStart ? '정지' : '시작', 
                    warningText: "Tip!! 현재 페이지를 벗어나면 타이머가 초기화됩니다.",
                    durationTime: _targetNumber
                  ),
              ],
            )
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
          _resetCounter();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }
}
