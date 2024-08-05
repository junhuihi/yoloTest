import 'package:flutter/material.dart';

class GlassPage extends StatelessWidget {
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
              '유리병',
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
                    '• 음료수병, 기타병류 등',
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
                    '• 내용물을 비우고 물로 헹구는 등 이물질을 제거하고 부착된 라벨을 제거한 후 배출\n• 유리병이 깨지지 않도록 주의하여 배출',
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
                    '• 깨진 유리병, 사기그릇, 전구, 거울 등은 유리병류가 아닙니다.\n• 깨진 유리제품은 사람이 다치지 않도록 신문지 등에 싸서 종량제 봉투에 배출\n• 소주, 맥주, 청량음료 공병은 빈용기보증금 대상으로 소매업(마트, 편의점) 등에 반환하면 보증금을 환급받을 수 있습니다.',
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
                                '빈용기보증금 제도란?',
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
                          '• 사용된 빈 병을 회수하고 재사용을 촉진하기 위해 제품의 가격에 <빈용기보증금>을 포함시켜 판매한다.\n'
                          '• 소비자는 유리용기의 제품을 구입한 후, 빈용기보증금 제품을 취급하고 있는 슈퍼, 대형마트 등의 소매점에 반환하면 <빈용기보증금>을 다시 돌려받을 수 있다.',
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
