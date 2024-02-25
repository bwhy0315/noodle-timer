import 'package:flutter/material.dart';
import 'package:noodle_timer/data/database.dart';
import 'package:noodle_timer/screen/action/a_action.dart';
import 'package:noodle_timer/screen/w_app_bar.dart';
import 'package:noodle_timer/screen/widget/w_raman_item.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchNoodleScreen extends StatefulWidget {
  const SearchNoodleScreen({Key? key}) : super(key: key);

  @override
  _SearchNoodleScreenState createState() => _SearchNoodleScreenState();
}

String searchText = '';

class _SearchNoodleScreenState extends State<SearchNoodleScreen> {
  RamenInfoList db = RamenInfoList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(titleName: "누들"),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: '검색어를 입력해주세요.',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ).pSymmetric(h: 20, v: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              '요리 이름'.text.bold.size(18).make().pSymmetric(h: 25, v:10),
              Row(
                children: [
                  '조리시간'.text.blue700.size(18).make().pSymmetric(h: 10),
                  '타이머'.text.black.size(18).make().pSymmetric(h: 15)
                ],
              ),
            ],
          ).box.withDecoration(
            BoxDecoration(
              border: Border.all(color: Colors.blue.shade200, width: 1),
              borderRadius: BorderRadius.circular(10)
            )).make().pOnly(left: 20, right: 20, bottom: 10, top: 5),
          Expanded(
            child: ListView.builder(
              itemCount: db.raMenInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                if (searchText.isNotEmpty &&
                    !db.raMenInfoList[index][0]
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                  return const SizedBox.shrink();
                }
                else {
                  return RamenItemWidget(
                    ramenName: db.raMenInfoList[index][0],
                    cookTime: db.raMenInfoList[index][1],
                    onTap: () { 
                      ItemClickEvent(
                        context, 
                        db.raMenInfoList[index][0],
                        db.raMenInfoList[index][1]
                      );
                    },
                  ).pSymmetric(h: 20, v: 6);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

      