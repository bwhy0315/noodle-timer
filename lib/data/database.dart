import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/main.dart';

class CustomTimerDataBase {

  List customRaMenInfoList = [
    
  ];

  final myBox = Hive.box(localName);

  void createInitialData() {
    customRaMenInfoList = [
      ['안성탕면(꾸찌라이식)', 20],
      ['신라면(엄마표)', 40],
      ['너구리(미역많이)', 30],
      ['내밥(protin)', 10],
    ];
  }

  void loadData(){

    customRaMenInfoList = myBox.get(dbUpdateKeyName);

  }

  void updateDataBase() {

    myBox.put(dbUpdateKeyName, customRaMenInfoList);

  }

}