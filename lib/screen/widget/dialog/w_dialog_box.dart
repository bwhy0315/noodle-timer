import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/box_sized/container.dart';
import 'package:noodle_timer/screen/widget/buttons/w_customButton.dart';
import 'package:noodle_timer/setting/settings.dart';

class TimerEditDialog extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController timeControllerM;
  final TextEditingController timeControllerS;
  final Function() onSave;
  final Function() onCancel;

  const TimerEditDialog({
    super.key, 
    required this.nameController,
    required this.timeControllerM,
    required this.timeControllerS,
    required this.onSave,
    required this.onCancel,
  });

  @override
  _TimerEditDialogState createState() => _TimerEditDialogState();
}

class _TimerEditDialogState extends State<TimerEditDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      // AlertDialog 일떄 TextField 는 화면에 나왔지만 버튼이 나오지 않았음 Dialog 로 바꾼뒤 버튼이 
      //생김 이유는 불명 우선 만들고 찾아보기
      backgroundColor: baseBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.blue.shade300, width: 1)
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 250,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.nameController,
              decoration: const InputDecoration( labelText: '요리 이름' ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.timeControllerM,
                    decoration: const InputDecoration( labelText: '분' ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                width10,
                Expanded(
                  child: TextField(
                    controller: widget.timeControllerS,
                    decoration: const InputDecoration( labelText: '초' ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  buttonText: "저장",
                  onPressed: widget.onSave, 
                  durationTime: 10,
                ),
                width5,
                CustomButton(
                  buttonText: "취소",
                  warningText: "타이머 작성이 취소되었습니다.",
                  onPressed: widget.onCancel, 
                  durationTime: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

