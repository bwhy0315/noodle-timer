import 'package:flutter/material.dart';
import 'package:noodle_timer/data/database.dart';
import 'package:noodle_timer/screen/action/a_action.dart';
import 'package:noodle_timer/screen/widget/w_raman_item.dart';

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
    //화면 구성
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '검색어를 입력해주세요.',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              // items 변수에 저장되어 있는 모든 값 출력
              itemCount: db.raMenInfoList.length,
              itemBuilder: (BuildContext context, int index) {
                // 검색 기능, 검색어가 있을 경우
                if (searchText.isNotEmpty &&
                    !db.raMenInfoList[index][0]
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                  return SizedBox.shrink();
                }
                // 검색어가 없을 경우, 모든 항목 표시
                else {
                  return RamenItemWidget(
                    ramenName: db.raMenInfoList[index][0],
                    cookTime: db.raMenInfoList[index][1],
                    onTap: () { 
                      ItemClickEvent(
                        context, 
                        index,
                        db.raMenInfoList[index][0],
                        db.raMenInfoList[index][1]
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

      