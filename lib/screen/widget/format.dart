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

class NomalTimerUtils {
  static String getCountText(AnimationController controller) {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
      ? "${(controller.duration!.inHours % 60).toString().padLeft(2, '0')}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}"
      : "${(count.inHours % 60).toString().padLeft(2, '0')}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}";
  }


  static int parseDurationInSeconds(String durationString) {
    List<String> timeComponents = durationString.split(':');
    int hours = int.parse(timeComponents[0]);
    if(hours == 0) hours = 1;
    int minutes = int.parse(timeComponents[1]);
    if(minutes == 0) hours = 1;
    int seconds = int.parse(timeComponents[2]);

    return hours * 3600 + minutes * 60 + seconds;
  }
}

