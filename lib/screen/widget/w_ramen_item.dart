import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:noodle_timer/screen/widget/w_my_button.dart';

class RamenItemWidget extends StatelessWidget {
  final String ramenName;
  final int cookTime;
  final VoidCallback onTap;
  Function(BuildContext)? deleteFunction;

  RamenItemWidget({
    super.key,
    required this.ramenName,
    required this.cookTime,
    required this.onTap,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255,253,222,140),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(children: [
              Text(ramenName, style: TextStyle(color: Colors.blue),),
              SizedBox(width: 10,),
              Text('${formatTime(cookTime)}', style: TextStyle(color: Colors.black),),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                onPressed: onTap,
                child: Text('선택', style: TextStyle(color: Colors.white),)
              ),
              const SizedBox(width: 4),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)
                ),
                onPressed: deleteFunction != null ? () => deleteFunction!(context) : null,
                child: Text('삭제', style: TextStyle(color: Colors.white),)
              )
            ],
          )
          
        ]
      ),
    );
  }
}