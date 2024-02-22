import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/timer_screen.dart';

void ItemClickEvent(BuildContext context, int index , String name, int time) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimerPage(ramenName: name, cookTime: time),
      ),
    );
  }