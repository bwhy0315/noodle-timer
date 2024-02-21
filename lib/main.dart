import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/notification/notification_service.dart';
import 'package:noodle_timer/screen/navigation_screen.dart';

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

const baseBackgroundColor = Color.fromARGB(255,253,222,140);
const myButtonBackgroundColor = Color.fromARGB(255,253,202,140);
const String localName = 'ramenTimerDB';
const String dbUpdateKeyName = 'CUSTOMTIMER';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

