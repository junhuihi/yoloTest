import 'package:flutter/material.dart';

class PlasticPage extends StatelessWidget {
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
              '플라스틱류',
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
                  '• 플라스틱 소재의 일회용컵, 양념통, 식품 포장 용기 등',
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
                  '• 내용물을 비우고 물로 헹구는 등 이물질을 제거한 후 배출\n• 부착상표, 부속품 등 플라스틱류와 다른 재질은 제거한 후 배출',
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
                  '• 물로 헹굴 수 없는 구조의 용기류는 종량제 봉투에 배출 (치약 용기 등)\n• 투명 페트병은 유색 페트병 및 플라스틱과 구분해 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
