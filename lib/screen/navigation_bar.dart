import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/custom/s_custom_list.dart';
import 'package:noodle_timer/screen/s_nomal_timer.dart';
import 'package:noodle_timer/screen/s_search_noodle.dart';
import 'package:noodle_timer/setting/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;

  final List<Widget> _navIndex = [
    const SearchNoodleScreen(),
    const CustomScreen(),
    const NomalTimerScreen()
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navIndex.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue[600],
        backgroundColor: baseBackgroundColor,
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '누들',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '커스텀누들',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: '타이머',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
      