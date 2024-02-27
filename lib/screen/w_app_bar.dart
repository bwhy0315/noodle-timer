import 'package:flutter/material.dart';
import 'package:noodle_timer/screen/widget/warning/snackbar.dart';
import 'package:noodle_timer/setting/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;

  const MyAppBar({Key? key, required this.titleName}) : super(key: key);
  
  launchKaKaoChannel() async {
    String url = "https://github.com/bwhy0315/noodle-timer";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //SnackbarUtils.showCustomSnackbar( context, 5, '허용된 접근이 아닙니다.');
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleName),
      backgroundColor: baseBackgroundColor,
      centerTitle: true,
      elevation: 0.0,
      actions: <Widget>[
        if(titleName != '기본 타이머')
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    backgroundColor: Color(0xfff5fbff),
                    appBar: const MyAppBar(titleName: '설정'),
                    body: Container(
                      child: ElevatedButton(
                        child: const Text('Open'),
                        onPressed: () async {
                          final url = Uri.parse('https://deku.posstree.com/en/');
                          if (await canLaunchUrl(url)) {
                            launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                      ),
                    ),
                  )
                )
              );
            },
          ),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}