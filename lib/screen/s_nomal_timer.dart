import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/box_sized/container.dart';
import 'package:noodle_timer/screen/widget/buttons/w_customButton.dart';
import 'package:noodle_timer/screen/widget/format.dart';
import 'package:noodle_timer/screen/widget/w_progress.dart';
import 'package:velocity_x/velocity_x.dart';

class NomalTimerScreen extends StatefulWidget {
  final int exTime;
  const NomalTimerScreen({super.key, required this.exTime});

  @override
  State<NomalTimerScreen> createState() => _NomalTimerScreenState();
}

class _NomalTimerScreenState extends State<NomalTimerScreen> with TickerProviderStateMixin{
  late AnimationController controller;
  bool isPlaying = false;
  bool alarmSet = false;
  double progress = 1.0;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(seconds: widget.exTime));
    controller.addListener(() {
      if (controller.isAnimating){
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
    if(widget.exTime == 0){
      setState(() {
        alarmSet = !alarmSet;
      });
    }
  }

  void bottomSheetTimeSet(){
    if(controller.isDismissed && widget.exTime == 0){
      showBottomSheet(
        context: context,
        builder: (context) => SizedBox(
          height: 200,
          child: CupertinoTimerPicker(
            initialTimerDuration: controller.duration!,
            onTimerDurationChanged: (time){
              setState(() {
                controller.duration = time;
              });
            },
          ),
        ),
      );
    }
  }

  void changeTimerBool(){
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:Stack(
            alignment: Alignment.center,
            children: [
              if(alarmSet)
                Positioned(
                  bottom: 200,
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: bottomSheetTimeSet, 
                        child: const Icon(Icons.arrow_upward,size: 20,)
                      ),
                      '클릭'.text.size(15).make()
                    ],
                  ),
                ),
              ProgressWidget(
                backgroundColor: Colors.grey.shade300,
                strokeColor: Colors.blue,
                progress: progress,
                strokeWidth: 6
              ),
              GestureDetector(
                onTap: bottomSheetTimeSet,
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) => NomalTimerUtils.getCountText(controller).text.size(60).bold.make()
                ),
              ),
            ],
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller.isAnimating)
              CustomButton(
                buttonText: '다시시작',
                onPressed: (){
                  controller.reset();
                  changeTimerBool();
                },
                durationTime: 0,
              ).pOnly(right:10)
            else
              height5,
              CustomButton(
                onPressed: (){
                  if (controller.isAnimating) {
                    controller.stop();
                  } else {
                    controller.reverse(
                      from: controller.value == 0 ? 1.0 : controller.value
                    );
                  }
                  changeTimerBool();
                },
                buttonText: controller.isAnimating ? '일시정지' : '시작', 
                warningText: "Tip!! 현재 페이지를 벗어나면 타이머가 초기화됩니다.",
                durationTime: controller.isAnimating ? 10 : 0
              ).pOnly(left:10)
          ],
        ).pOnly(bottom:50)
      ],
    );
  }
}