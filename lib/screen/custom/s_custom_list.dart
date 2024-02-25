import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noodle_timer/data/database.dart';
import 'package:noodle_timer/screen/action/a_action.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/buttons/w_create_timer_button.dart';
import 'package:noodle_timer/screen/widget/controller.dart';
import 'package:noodle_timer/screen/widget/format.dart';
import 'package:noodle_timer/screen/widget/dialog/w_dialog_box.dart';
import 'package:noodle_timer/screen/widget/w_raman_item.dart';
import 'package:noodle_timer/screen/widget/warning/snackbar.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  _CustomScreenState createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  final myBox = Hive.box('ramenTimerDB');
  CustomTimerDataBase db = CustomTimerDataBase();

  final String emptyDB = "저장된 타이머가 없습니다\n 자신만의 타이머를 만들어 보세요!!";

  @override
  void initState() {
    if (myBox.get(dbUpdateKeyName) == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewTimer() {
    if(nameController.text.isEmpty || timeControllerM.text.isEmpty || timeControllerS.text.isEmpty){
      SnackbarUtils.showCustomSnackbar(context, 5, "Tips! 입력을 올바르게 해 주세요.");
    } else {
      setState(() {
        db.customRaMenInfoList.add([
          nameController.text, 
          formatCookTime(
            timeControllerM.text,
            timeControllerS.text,
          )
        ]);
      });
      _clearControllersAndPop();
      db.updateDataBase();
    }
  }
  void updateSave(int idx){
    setState(() {
      db.customRaMenInfoList[idx][0] = nameController.text;
      db.customRaMenInfoList[idx][1] = formatCookTime(
        timeControllerM.text,
        timeControllerS.text,
      );
    });
    _clearControllersAndPop();
  }

  void createNewTimer(){
    showDialog(
      context: context,
      builder: (context) {
        return TimerEditDialog(
          nameController: nameController,
          timeControllerM: timeControllerM,
          timeControllerS: timeControllerS,
          onSave: saveNewTimer,
          onCancel: _clearControllersAndPop
        );
      },
    );  
  }

  void updateTimer(int index) {
    nameController.text = db.customRaMenInfoList[index][0];
    timeControllerM.text = (db.customRaMenInfoList[index][1] ~/ 60).toString();
    timeControllerS.text = (db.customRaMenInfoList[index][1] % 60).toString();

    showDialog(
      context: context,
      builder: (context) {
        return TimerEditDialog(
          nameController: nameController,
          timeControllerM: timeControllerM,
          timeControllerS: timeControllerS,
          onSave:() => updateSave(index),
          onCancel: _clearControllersAndPop
        );
      },
    );
  }

  void deleteTimer(int idx){
    setState(() {
      db.customRaMenInfoList.removeAt(idx);
    });
    db.updateDataBase();
  }

  void _clearControllersAndPop() {
    setState(() {
      nameController.clear();
      timeControllerM.clear();
      timeControllerS.clear();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(titleName: '커스텀누들'),
      floatingActionButton: CreateTimerButton(onPressed: createNewTimer),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if(db.customRaMenInfoList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: db.customRaMenInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return RamenItemWidget(
                    ramenName: db.customRaMenInfoList[index][0],
                    cookTime: db.customRaMenInfoList[index][1],
                    onTap: () { 
                      ItemClickEvent(
                        context, 
                        db.customRaMenInfoList[index][0],
                        db.customRaMenInfoList[index][1]
                      );
                    },
                    deleteFunction: (context) => deleteTimer(index),
                    updateFunction: (context) => updateTimer(index),
                  ).pSymmetric(v:10);
                },
              ),
            )
          else 
             Center(child: emptyDB.text.align(TextAlign.center).bold.make())
        ],
      ).p(10),
    );
  }
}