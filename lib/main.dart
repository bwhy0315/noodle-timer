import 'package:flutter/material.dart';
import 'package:noodle_timer/notification/notification_service.dart';
import 'package:noodle_timer/screen/home_screen.dart';

import 'screen/my_home_page.dart';

void main() async {

  final notificationService = NotificationService();
  // Flutter 엔진 초기화
  WidgetsFlutterBinding.ensureInitialized();
  // 로컬 푸시 알림 초기화
  await notificationService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noodle-Timer Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

