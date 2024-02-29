import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/s_option.dart';
import 'package:noodle_timer/setting/settings.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;

  const MyAppBar({required this.titleName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleName),
      backgroundColor: baseBackgroundColor,
      centerTitle: true,
      elevation: 0.0,
      actions: <Widget>[
        if(titleName != '옵션' )
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const OptionScreen()
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