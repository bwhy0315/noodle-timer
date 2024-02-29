import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/format.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:velocity_x/velocity_x.dart';

class RamenItemWidget extends StatefulWidget {
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
  _RamenItemWidgetState createState() => _RamenItemWidgetState();
}

class _RamenItemWidgetState extends State<RamenItemWidget> {
  bool isOpen = false;
  ButtonStyle iconButtonColor = ButtonStyle( backgroundColor:  MaterialStateProperty.all(Colors.red));
  void isOpenSetting(){
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: baseBackgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          truncateRamenName(widget.ramenName)
            .text.bold.size(19).textStyle(
              TextStyle( color: Colors.brown[800])
            ).make().pOnly(left: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              formatTime(widget.cookTime).text.bold.size(20).textStyle(
                TextStyle(color: Colors.blue[600])
              ).make().pOnly(top:20, bottom: 20, right:widget.deleteFunction != null ? 0 : 15),
              IconButton(
                icon: const Icon(Icons.access_time, size: 40),
                onPressed: widget.onTap,
              ).pOnly(right: widget.deleteFunction != null ? 0 : 10, left:widget.deleteFunction != null ? 0 : 15),

              if ((widget.deleteFunction != null ))
                if(!isOpen)
                  IconButton(
                    icon: const Icon(Icons.settings, size: 40),
                    onPressed: isOpenSetting
                  ),
                if(isOpen)
                  IconButton(
                    style: iconButtonColor,
                    onPressed: widget.updateFunction != null
                      ? () => {
                          widget.updateFunction!(context),
                          setState(() { isOpen = !isOpen; })
                        }
                      : null,
                    icon: const Icon(Icons.edit, color: Colors.white,),
                  ),
                if(isOpen)
                  IconButton(
                    style: iconButtonColor,
                    onPressed: widget.deleteFunction != null
                      ? () => widget.deleteFunction!(context)
                      : null,
                    icon: const Icon(Icons.delete, color: Colors.white,),
                  ),
            ],
          )
        ],
      ),
    ).box.withDecoration(
      BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(11)
      )).make();
  }
}
