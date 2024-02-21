import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noodle_timer/notification/notification_service.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:permission_handler/permission_handler.dart';


class TimerPage extends StatefulWidget {
  final String ramenName;
  final int cookTime;
  const TimerPage({Key? key, required this.ramenName, required this.cookTime}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late int _targetNumber;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _targetNumber = widget.cookTime;
    _requestNotificationPermissions();
  }

  void _requestNotificationPermissions() async {
    final status = await NotificationService().requestNotificationPermissions();
    if (status.isDenied && context.mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('알림 권한이 거부되었습니다.'),
          content: Text('알림을 받으려면 앱 설정에서 권한을 허용해야 합니다.'),
          actions: <Widget>[
            TextButton(
              child: Text('설정'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('쭈미로운 생활 푸시 알림 예제')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${widget.ramenName}'),
            Text('타이머: ${formatTime(_targetNumber)}'),
            
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('초기화'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _toggleTimer,
                  child: Text(_timer?.isActive != false  ? '정지' : '시작'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _resetCounter() {
    setState(() {
      _targetNumber = widget.cookTime;
      _stopTimer();
    });
  }

  void _toggleTimer() {
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
