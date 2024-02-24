import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/buttons/w_my_button.dart';
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
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.nameController,
              decoration: InputDecoration(
                labelText: '요리 이름',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.timeControllerM,
                    decoration: InputDecoration(
                      labelText: '분',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: widget.timeControllerS,
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
                  onPressed: widget.onSave,
                ),
                const SizedBox(width: 4),
                MyButton(
                  text: "취소",
                  onPressed: widget.onCancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

