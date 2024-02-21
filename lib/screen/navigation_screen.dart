import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/custom/s_custom_list.dart';
import 'package:noodle_timer/screen/s_search_noodle.dart';

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
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //화면 구성
    return Scaffold(
      body: _navIndex.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'noodle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'CustomNoodle',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
      