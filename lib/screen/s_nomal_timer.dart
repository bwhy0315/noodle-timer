import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/buttons/w_nomal_button.dart';
import 'package:velocity_x/velocity_x.dart';

class NomalTimerScreen extends StatefulWidget {
  const NomalTimerScreen({super.key});

  @override
  State<NomalTimerScreen> createState() => _NomalTimerScreenState();
}

class _NomalTimerScreenState extends State<NomalTimerScreen> with TickerProviderStateMixin{
  late AnimationController controller;

  bool isPlaying = false;

  String get countText{
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
      ? "${(controller.duration!.inHours % 60)
          .toString().padLeft(2,'0')}:${(controller.duration!.inMinutes % 60)
          .toString().padLeft(2,'0')}:${(controller.duration!.inSeconds % 60)
          .toString().padLeft(2,'0')}"

      : "${(count.inHours % 60)
          .toString().padLeft(2,'0')}:${(count.inMinutes % 60)
          .toString().padLeft(2,'0')}:${(count.inSeconds % 60)
          .toString().padLeft(2,'0')}";
  }

  double progress = 1.0;

  @override
  void initState() {
    
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1000)
    );

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
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5fbff),
      appBar: const MyAppBar(titleName: '기본 타이머'),
      body: Column(
        children: [
          Expanded(
            child:Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 300, width: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 6,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    if(controller.isDismissed){
                      showBottomSheet(
                        context: context, 
                        builder: (context) => 
                        Container(
                          height: 100,
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
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => 
                      countText.text.size(60).bold.make()),
                ),
              ],
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  if (controller.isAnimating){
                    controller.stop();
                    isPlaying = !isPlaying;
                  } else{
                    controller.reverse(
                      from: controller.value == 0 ? 1.0 : controller.value
                    );
                    isPlaying = !isPlaying;
                  }
                },
                child: RoudedButton(
                  icon: isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              GestureDetector(
                onTap: () {

                },
                child: RoudedButton(
                  icon: Icons.stop,
                ),
              )
            ],
          ).pSymmetric(h: 10, v: 20)
        ],
      )
    );
  }
}