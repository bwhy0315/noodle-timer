import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/box_options/container.dart';
import 'package:noodle_timer/screen/notification/notification_service.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/buttons/w_custom_button.dart';
import 'package:noodle_timer/screen/widget/format.dart';
import 'package:noodle_timer/screen/widget/w_progress.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:velocity_x/velocity_x.dart';

class TimerPage extends StatefulWidget {
  final String ramenName;
  final String? titleName;
  final int cookTime;

  const TimerPage({
    Key? key, 
    required this.ramenName, 
    required this.cookTime, 
    this.titleName
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
            widget.ramenName.text.size(30).make().pOnly(bottom:60),
            Stack(
              alignment: Alignment.center,
              children: [
                formatTime(_targetNumber).text.size(80).make().box.make(),
                ProgressWidget(
                  backgroundColor: Colors.grey.shade300,
                  strokeColor: baseBackgroundColor,
                  progress: progress,
                  strokeWidth: 13
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isStart)
                  CustomButton(
                    buttonText: '다시시작',
                    onPressed: _resetCounter,
                    durationTime: 0,
                  ).pOnly(right:10)
                else
                  height5,
                  CustomButton(
                    onPressed: _toggleTimer,
                    buttonText: isStart ? '일시정지' : '시작', 
                    warningText: "Tip!! 현재 페이지를 벗어나면 타이머가 초기화됩니다.",
                    durationTime: _targetNumber
                  ).pOnly(left:10),
              ],
            ).p(60)
          ],
        ),
      ),
    );
  }

  void _resetCounter() {
    setState(() {
      _targetNumber = widget.cookTime;
        isStart = !isStart;
        _timer?.cancel();
    });
  }

  void _toggleTimer() {
    setState(() {
      if (isStart == true) {
        _timer?.cancel();
      } else {
        _startTimer();
      }
      isStart = !isStart;
    });
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
}
