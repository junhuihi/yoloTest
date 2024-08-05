import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.recycling, color: Colors.white),
            SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격
            Text(
              '음식물류',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 패딩 추가
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    '예시',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                  child: Text(
                    '• 식품의 생산 · 유통 · 가공 · 조리과정에서 발생하는 농 · 수 · 축산물 쓰레기와 먹고 남은 음식찌꺼기 등',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text(
                    '버리는 방법',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                  child: Text(
                    '• 물기를 꽉 짜서 최대한 수분을 제거한 후 배출합니다.\n'
                    '• 일회용 비닐봉지, 나무젓가락, 이쑤시개 등 음식물쓰레기 외의 이물질은 제거\n'
                    '• 배출요일 및 배출시간 준수.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                  child: Text(
                    '주의',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                  child: Text(
                    '• 길이가 긴 채소류와 덩어리가 큰 수박 등은 잘게 썰어 부피를 줄여서 배출\n'
                    '• 소금 성분이 많은 김치, 된장, 고추장 등은 물에 헹군 후 배출\n• 음식물 쓰레기가 아닌 품목들은 종량제 봉투에 배출',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(106, 201, 159, 1),
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromRGBO(106, 201, 159, 0.5), // 제목 배경색 설정
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '일반쓰레기 품목',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white, // 내용 배경색 설정
                        child: Text(
                          '• 쪽파, 대파, 옥수수껍질, 양파 등 채소류의 껍질 및 뿌리\n'
                          '• 코코넛, 파인애플, 도토리, 호두 등 딱딱한 껍질 (수박, 멜론 등 쉽게 분해되는 특성을 가진 과일은 음식물쓰레기로 배출)'
                          '• 소, 돼지, 닭 등의 털 및 뼈다귀\n'
                          '• 조개, 소라, 전복 등 패류 껍데기\n'
                          '• 달걀, 오리알, 메추리알, 타조알 등 알껍질\n'
                          '• 각종 차류(녹차 등)의 티백과 찌꺼기\n'
                          '• 바나나 꼭지 (바나나껍질은 음식물쓰레기)\n',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
