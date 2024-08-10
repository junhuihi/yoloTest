import 'package:flutter/material.dart';

class EtcPage extends StatelessWidget {
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
              '기타',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0), // 전체 패딩 추가
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  '고철',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 고철(공기구, 철사, 못 등)\n'
                  '• 비철금속(알루미늄, 스테인리스 등)\n'
                  '• 이물질이 섞이지 않도록 한 후 봉투에 넣거나 끈으로 묶어서 배출',
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
                  '의류',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 의류, 가방, 신발, 이불, 커텐 등\n'
                  '• 가까운 의류수거함에 배출하거나 특수규격봉투에 담아 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Text(
                  '전지류',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 건전지, 보조배터리 등\n'
                  '• 주요거점(동 행정복지센터, 편의점, 아파트 등)의 전용수거함에 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Text(
                  '형광등',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 형광등, LED등\n'
                  '• 폐형광등수거함에 배출\n'
                  '• 깨진 폐형광등은 사람이 다치지 않도록 신문지 등에 싸서 종량제 봉투에 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Text(
                  '식용유',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 식용유, 콩기름, 등기름, 식물성 기름 등\n'
                  '• 음식물 등 이물질이 섞이지 않도록 하여 동 행정복지센터 등에 설치된 폐식용유 전용 수거함에 배출\n'
                  '• 동물성 기름은 개인 수거업자를 통해 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Text(
                  '대형폐기물',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 가전제품을 제외한 가구류, 사무기자재, 전기장판, 전기안마의자, 옥매트, 솜이불 등\n'
                  '• 소속 구청 또는 행정복지센터에 신고 후 배출일정에 맞추어 배출',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                child: Text(
                  '폐가전',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // 왼쪽 여백 추가
                child: Text(
                  '• 소형가전\n'
                  '  - 전자레인지, 선풍기 등 크기 1m 미만\n'
                  '  - 구청에 신고 후 배출\n\n'
                  '• 대형가전\n'
                  '  - 세탁기, 냉장고, 에어컨 등 크기 1m 미만\n'
                  '  - 폐가전 무상 방문 수거 서비스 신고 후 배출',
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
