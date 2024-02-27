import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/s_nomal_timer.dart';
import 'package:noodle_timer/setting/settings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;

  const MyAppBar({Key? key, required this.titleName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleName),
      backgroundColor: baseBackgroundColor,
      centerTitle: true,
      elevation: 0.0,
      actions: <Widget>[
        if(titleName != '기본 타이머')
          IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const Scaffold(
                    backgroundColor: Color(0xfff5fbff),
                    appBar: MyAppBar(titleName: '기본 타이머'),
                    body: NomalTimerScreen(exTime: 0,),
                  )
                )
              );
            },
          ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}