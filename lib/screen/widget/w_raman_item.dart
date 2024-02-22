import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:noodle_timer/setting/settings.dart';

class RamenItemWidget extends StatelessWidget {
  final String ramenName;
  final int cookTime;
  final VoidCallback onTap;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? updateFunction;

  const RamenItemWidget({
    Key? key,
    required this.ramenName,
    required this.cookTime,
    required this.onTap,
    this.deleteFunction,
    this.updateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: baseBackgroundColor,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(children: [
              Text(
                ramenName,
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${formatTime(cookTime)}',
                style: TextStyle(color: Colors.black),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(deleteFunction != null || updateFunction != null) Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: onTap,
                      child: Text(
                        '선택',
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed:
                          deleteFunction != null ? () => deleteFunction!(context) : null,
                      child: Text(
                        '삭제',
                        style: TextStyle(color: Colors.white),
                      )  
                    ),
                    const SizedBox(width: 2),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed:
                          updateFunction != null ? () => updateFunction!(context) : null,
                      child: Text(
                        '수정',
                        style: TextStyle(color: Colors.white),
                      )
                    )
                  ],
                ) 
              else 
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: onTap,
                  child: Text(
                    '선택',
                    style: TextStyle(color: Colors.white),
                  )
                ),
            ],
          )
        ],
      ),
    );
  }
}
