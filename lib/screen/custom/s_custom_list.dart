import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/data/database.dart';
import 'package:noodle_timer/main.dart';
import 'package:noodle_timer/screen/timer_screen.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:noodle_timer/screen/widget/w_my_button.dart';
import 'package:noodle_timer/screen/widget/w_ramen_item.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {

  final myBox = Hive.box(localName);
  CustomTimerDataBase db = CustomTimerDataBase();

  @override
  void initState() {
    if (myBox.get(dbUpdateKeyName) == null){
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final nameController = TextEditingController();
  final timeControllerM = TextEditingController();
  final timeControllerS = TextEditingController();

  void cardClickEvent(BuildContext context, int index) {
    String name = db.customRaMenInfoList[index][0];
    int time = db.customRaMenInfoList[index][1];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimerPage(ramenName: name, cookTime: time),
      ),
    );
  }

  void saveNewTimer() {
    setState(() {
      int m = int.parse(timeControllerM.text);
      int s = int.parse(timeControllerS.text);

      int saveSeconds = SaveformatTime(m, s);

      db.customRaMenInfoList.add([
        nameController.text, 
        saveSeconds
      ]);
      nameController.clear();
      timeControllerM.clear();
      timeControllerS.clear();
    });
    Navigator.pop(context);
    db.updateDataBase();
  }
  
  void cancleTimer() {
    nameController.clear();
    timeControllerM.clear();
    timeControllerS.clear();
    Navigator.pop(context);
  }

  void createNewTimer(){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: baseBackgroundColor,
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: '요리 이름',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: timeControllerM, // 수정된 부분
                        decoration: InputDecoration(
                          labelText: '분',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        controller: timeControllerS,
                        decoration: InputDecoration(
                          labelText: '초',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      text: "저장",
                      onPressed: saveNewTimer
                    ),
                    const SizedBox(width: 4),
                    MyButton(
                      text: "취소",
                      onPressed: cancleTimer
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }

  void deleteTimer(int index){
    setState(() {
      db.customRaMenInfoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    //화면 구성
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTimer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: baseBackgroundColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              // items 변수에 저장되어 있는 모든 값 출력
              itemCount: db.customRaMenInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                return RamenItemWidget(
                  ramenName: db.customRaMenInfoList[index][0],
                  cookTime: db.customRaMenInfoList[index][1],
                  onTap: () { 
                    cardClickEvent(context, index);
                  },
                  deleteFunction: (context) => deleteTimer(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

      