import 'package:flutter/material.dart';

//설정화면
class Settingpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Settingpage();
}

class _Settingpage extends State<Settingpage> {
  List<List<String>> team = [
    ['김준희', '김지희', '김채원', '신서연', '이현수'],
    [
      'https://github.com/junhuihi',
      'https://github.com/romdyfo',
      'https://github.com/one-chae',
      'https://github.com/seoyeon0918',
      'https://github.com/stella9921'
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF6AC99F),
        title: Text(
          '설정',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(children: <Widget>[
        ListTile(
          title: Text('개발자 정보'),
          onTap: () {
            teamInfo(context);
          },
        ),
        Divider(height: 1),
        ListTile(
          title: Text('버전 0.0.1'),
        ),
        Divider(height: 1),
      ]),
    );
  }

  void teamInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '개발자 정보',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: team[0].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(team[0][index]),
                  subtitle: Text(team[1][index]),
                );
              },
            ),
          ),
          actions: <Widget>[
            Padding(padding: EdgeInsets.all(0)),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('닫기'),
            ),
          ],
          actionsPadding: EdgeInsets.all(10),
        );
      },
    );
  }
}

/*
리스트 참고: 
https://nayotutorial.tistory.com/54
https://pythonkim.tistory.com/122

https://initstory.tistory.com/131

*/