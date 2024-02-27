import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/custom/s_custom_list.dart';
import 'package:noodle_timer/screen/s_nomal_timer.dart';
import 'package:noodle_timer/screen/s_search_noodle.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
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
    const Scaffold(
      backgroundColor: Color(0xfff5fbff),
      appBar: MyAppBar(titleName: '3분 타이머'),
      body: NomalTimerScreen(exTime: 180,),
    )
    
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: const Border(top: BorderSide(color: optionPerpleColor, width: 1.0)), 
          borderRadius: BorderRadius.circular(30),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: optionPerpleColor,
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            fixedColor: Colors.blue[600],
            backgroundColor: baseBackgroundColor,
            unselectedItemColor: Colors.grey[700],
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
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
                label: '3분',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onNavTapped,
          ),
        ),
      ),
    );
  }
}
      