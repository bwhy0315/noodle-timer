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
    return AlertDialog(
      backgroundColor: baseBackgroundColor,
      content: SizedBox(
        height: 200,
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
                // 저장을 누르면 빈값을 저장 해도 warningText 가 넘어가서 타이머 저장 되었다고 snackbar가 나타남 고쳐야 함
                CustomButton(
                  buttonText: "저장",
                  warningText: "타이머 저장됨",
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

