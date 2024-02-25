import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/setting/settings.dart';

class CustomTimerDataBase {

  List customRaMenInfoList = [];

  final myBox = Hive.box('ramenTimerDB');

  void createInitialData() {
    customRaMenInfoList = [ ];
  }

  void loadData(){
    customRaMenInfoList = myBox.get(dbUpdateKeyName);
  }

  void updateDataBase() {
    myBox.put(dbUpdateKeyName, customRaMenInfoList);
  }
}

class RamenInfoList {
  List raMenInfoList = [
    ['안성탕면', 240],
    ['진라면 매운맛', 240],
    ['비빔면', 180],
    ['무파마', 270],
    ['짜파게티', 210],
    ['오징어짬뽕', 160],
    ['신라면', 240],
    ['삼양라면', 240],
    ['너구리', 240],
    ['참께라면', 240],
    ['불닭볶음면', 300],
    ['틈새라면 빨계떡', 270],
    ['진짬뽕', 240],
    ['진라면 순한맛', 240],
    ['짜왕', 300],
    ['까르보 불닭볶음면', 300],
    ['일품 해물라면', 240],
    ['남자라면', 270],
    ['꼬꼬면', 240],
    ['라볶이', 240],
    ['순한 너구리', 240],
    ['사리곰탕', 240],
    ['신라면 블랙', 270],
    ['육개장라면', 240],
    ['감자면', 240],
    ['라면사리', 270],
    ['열라면', 240],
    ['진짜장', 240],
    ['왕뚜껑', 180],
    ['김치라면', 180],
    ['신라면 건면', 240],
    ['신라면 볶음면', 270],
    ['짜왕 건면', 300],
    ['앵그리 너구리', 300],
    ['튀김우동', 300],
    ['사천백짬뽕', 240],
    ['해물 안성탕면', 240],
    ['얼큰 장칼국수', 270],
    ['멸치 칼국수', 240],
    ['배호동 비빔면', 210],
    ['배호동 쫄쫄면', 270],
    ['둥지냉면 동치미물냉면', 300],
    ['둥지냉면 비빔냉면', 180],
    ['생생우동', 150],
    ['생생야끼우동', 90],
    ['생생야끼우동 데리야끼맛', 120],
    ['보글보글 부대찌개면', 270],
    ['찰비빔면', 240],
    ['사리면', 210],
  ];
}