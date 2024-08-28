import 'package:flutter/material.dart';
import 'categories/home.dart';
import 'package:image_picker/image_picker.dart';
import 'imageSearch/camera_result.dart';
import 'imageSearch/imageNotfind.dart';
import 'imageSearch/imageSearchPage.dart';
import 'imageSearch/camera.dart';
import 'sets/settingPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JigujicamE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAppPage(title: 'JigujicamE1'),
    );
  }
}

class MyAppPage extends StatefulWidget {
  MyAppPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyAppPage createState() => _MyAppPage();
}

class _MyAppPage extends State<MyAppPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          children: <Widget>[
            Home(),
            YoloImage(),
            Settingpage(),
          ],
          controller: controller,
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.home),
                text: '홈',
              ),
              Tab(
                icon: Icon(Icons.camera),
                text: '이미지 검색',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: '설정',
              )
            ],
            controller: controller,
            indicatorColor: Color(0xFF), //선택된 라벨 밑줄색
            indicatorWeight: 5, //선택된 라벨 b밑줄  굵기
            labelColor: Colors.black, //선택된 탭 색상
            unselectedLabelColor: Colors.white, // 선택되지 않은 탭의 색상
          ),
          color: Color(0xFF6AC99F),
        ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
