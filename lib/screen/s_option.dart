import 'package:flutter/material.dart';
import 'package:noodle_timer/oss_licenses_page.dart';
import 'package:noodle_timer/screen/box_options/container.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(titleName: '옵션'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
            child: SizedBox(
              width: MediaQuery.of(context).size.width ,
              child: '개발자 깃허브'.text.make()
            ),
            onPressed: () async {
              final url = Uri.parse('https://github.com/bwhy0315/noodle-timer');
              if (await canLaunchUrl(url)) {
                launchUrl(url, mode: LaunchMode.externalApplication);
              }
            },
          ),
          rowLine,
          MaterialButton(
            onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) =>  OssLicensesPage(),) 
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width ,
              child: '오픈 라이선스'.text.make()
            ),
          ),
          rowLine,
        ],
      ),
                  );
  }
}