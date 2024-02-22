String formatTime(int seconds) {
  int minutes = seconds ~/ 60;
  int remainingSeconds = seconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}

int SaveformatTime(int m, int s) {
  int minutes = m * 60;
  int saveSeconds = minutes + s;

  return saveSeconds;
}

int formatCookTime(String M, String S){
  int m = int.parse(M);
  int s = int.parse(S);

  int cookTimes = SaveformatTime(m, s);
  return cookTimes;
}