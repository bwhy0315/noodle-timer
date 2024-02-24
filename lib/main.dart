import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/screen/notification/notification_service.dart';
import 'package:noodle_timer/screen/navigation_bar.dart';
import 'package:noodle_timer/setting/settings.dart';

void main() async {

  final notificationService = NotificationService();
  // Flutter 엔진 초기화
  WidgetsFlutterBinding.ensureInitialized();
  // 로컬 푸시 알림 초기화
  
  await Hive.initFlutter();
  await notificationService.init();

  var box = await Hive.openBox(localName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noodle-Timer Project',
      home: const HomeScreen(),
    );
  }
}

