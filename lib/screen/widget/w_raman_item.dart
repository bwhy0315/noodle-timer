import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/box_sized/container.dart';
import 'package:noodle_timer/screen/widget/formatTime.dart';
import 'package:noodle_timer/setting/settings.dart';

class RamenItemWidget extends StatefulWidget {
  final String ramenName;
  final int cookTime;
  final VoidCallback onTap;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? updateFunction;
  final Function(BuildContext)? itemSetting;

  const RamenItemWidget({
    Key? key,
    required this.ramenName,
    required this.cookTime,
    required this.onTap,
    this.deleteFunction,
    this.updateFunction,
    this.itemSetting,
  }) : super(key: key);

  @override
  _RamenItemWidgetState createState() => _RamenItemWidgetState();
}

class _RamenItemWidgetState extends State<RamenItemWidget> {
  bool isOpen = false;

  void isOpenSetting(){
    setState(() {
      isOpen = !isOpen;
    });
  }

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
            child: Row(
              children: [
                Text(
                  widget.ramenName,
                  style: TextStyle(color: Colors.blue),
                ),
                width5,
                Text(
                  '${formatTime(widget.cookTime)}',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.access_time),
                onPressed: widget.onTap,
              ),
              height10,
              if ((widget.deleteFunction != null || widget.updateFunction != null) && !isOpen)

                if(!isOpen)
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: isOpenSetting
                  ),

                if(isOpen)
                  Row(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all(Colors.red)
                        ),
                        onPressed: widget.updateFunction != null
                          ? () => {
                              widget.updateFunction!(context),
                              setState((){
                                isOpen = !isOpen;
                              })
                            }
                          : null,
                        child: Text(
                          '수정',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      height5,
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)
                        ),
                        onPressed: widget.deleteFunction != null
                          ? () => widget.deleteFunction!(context)
                          : null,
                        child: Text(
                          '삭제',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
            ],
          )
        ],
      ),
    );
  }
}
