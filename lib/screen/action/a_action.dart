import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/s_noodle_timer.dart';

// ignore: non_constant_identifier_names
void ItemClickEvent(BuildContext context, String name, int time) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TimerPage(ramenName: name, cookTime: time),
    ),
  );
}
