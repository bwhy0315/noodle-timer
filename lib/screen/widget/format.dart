import 'package:flutter/material.dart';

String formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}

int saveformatTime(int m, int s) {
  int minutes = m * 60;
  int saveSeconds = minutes + s;

  return saveSeconds;
}

int formatCookTime(String M, String S){
  int m = int.parse(M);
  int s = int.parse(S);

  int cookTimes = saveformatTime(m, s);
  return cookTimes;
}

String truncateRamenName(String ramenName) {
  const int maxCharacters = 9;
  
  if (ramenName.length <= maxCharacters) {
    return ramenName;
  } else {
    return '${ramenName.substring(0, maxCharacters)}...';
  }
}