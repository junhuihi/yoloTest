import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'vinyl_page.dart';
import 'plastic_page.dart';
import 'paper_page.dart';
import 'glass_page.dart';
import 'can_page.dart';
import 'styrofoam_page.dart';
import 'food_page.dart';
import 'etc_page.dart';
import '../sets/settingPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> oxQuestions = [
    {
      'question': '보조배터리,\n일반쓰레기에 버린다.',
      'answer': true,
      'background': 'assets/images/OX퀴즈 배경.png',
      'question_answer':
          '건전지, 보조배터리 등 폐건전지류는 재활용이 가능하므로 주요거점(동 행정복지센터, 편의점, 아파트 등)의 전용수거함에 배출합니다.',
    },
    {
      'question': '유통기한 지난 마요네즈,\n일반쓰레기에 버린다.',
      'answer': false,
      'background': 'assets/images/OX퀴즈 배경.png',
      'question_answer':
          '마요네즈, 버터 등 기름이 많은 음식물은 녹이지 않은 채로 키친타월이나 신문에 싸서 일반쓰레기로 배출합니다.',
    },
    {
      'question': '우산,\n일반쓰레기에 버린다.',
      'answer': true,
      'background': 'assets/images/OX퀴즈 배경.png',
      'question_answer':
          '우산 뼈대와 원단을 분리하여 재질에 맞게 배출합니다. 일반적으로 뼈대는 캔류(철), 불투명 원단은 일반쓰레기, 투명 비닐 원단은 비닐로 배출합니다.',
    },
    {
      'question': '택배 비닐 포장지,\n비닐에 버린다.',
      'answer': true,
      'background': 'assets/images/OX퀴즈 배경.png',
      'question_answer': '운송장 스티커를 제거한 후, 비닐류로 배출합니다. 운송장 스티커를 일반쓰레기로 배출합니다.',
    },
    {
      'question': 'L자 화일,\n일반쓰레기에 버린다.',
      'answer': true,
      'background': 'assets/images/OX퀴즈 배경.png',
      'question_answer': '이물질을 제거한 후 불투명 재질은 플라스틱류, 투명 재질은 페트류로 배출합니다.',
    },
  ];

  final List<String> gridImages = [
    'assets/images/vinyl.jpg',
    'assets/images/plastic.jpg',
    'assets/images/paper.png',
    'assets/images/glass.jpg',
    'assets/images/can.jpg',
    'assets/images/styrofoam.jpg',
    'assets/images/food.png',
    'assets/images/etc.png',
  ];

  final List<String> buttonTexts = [
    '비닐류',
    '플라스틱류',
    '종이류',
    '유리병',
    '캔류',
    '스티로폼류',
    '음식물류',
    '기타',
  ];

  int currentQuestionIndex = 0;

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = oxQuestions[currentQuestionIndex]['answer'];

    // 결과 팝업 표시
    _showResultDialog(userAnswer == correctAnswer);
  }

  void _showResultDialog(bool answeredCorrectly) {
    String resultText = answeredCorrectly ? '정답입니다' : '오답입니다';
    IconData resultIcon =
        answeredCorrectly ? Icons.radio_button_unchecked : Icons.close;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          contentPadding: EdgeInsets.all(20.0),
          titlePadding: EdgeInsets.all(0),
          title: Container(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            decoration: BoxDecoration(
              color: Color(0xffAFDEC9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 98.0),
                  child: Text(
                    resultText,
                    style: TextStyle(
                      color: const Color(0xff585858),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Container(
              height: 170, // 컨테이너 높이 설정
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 수직 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 수평 정렬
                children: [
                  Icon(
                    resultIcon,
                    color: Color(0xffAFDEC9),
                    size: 50.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    oxQuestions[currentQuestionIndex]['question_answer'] ??
                        '해설 표시 에러',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildIndicator() {
    return List<Widget>.generate(oxQuestions.length, (index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentQuestionIndex == index
              ? Color.fromARGB(255, 65, 255, 87)
              : Colors.white,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JigujiCamE'),
        backgroundColor: const Color(0xff6AC99F),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOut,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentQuestionIndex = index;
                      });
                    },
                  ),
                  items: oxQuestions.map((questionData) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                questionData['background'] ??
                                    'assets/images/OX퀴즈 배경.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    20.0, 60.0, 20.0, 10.0),
                                child: Stack(
                                  children: [
                                    // 테두리 역할을 할 텍스트
                                    Text(
                                      questionData['question'],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 2
                                          ..color =
                                              const Color(0xff6AC99F), // 테두리 색상
                                      ),
                                    ),
                                    // 실제 텍스트
                                    Text(
                                      questionData['question'],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white, // 텍스트 색상
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      checkAnswer(true);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, // 글자색
                                      backgroundColor:
                                          const Color(0xff6AC99F), // 배경색
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // 둥글기 조절
                                      ),
                                    ),
                                    child: Text('O'),
                                  ),
                                  SizedBox(width: 20.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      checkAnswer(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white, // 글자색
                                      backgroundColor:
                                          const Color(0xff6AC99F), // 배경색
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // 둥글기 조절
                                      ),
                                    ),
                                    child: Text('X'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 10.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicator(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0), // 슬라이더 아래 여백 추가
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 10.0,
                  mainAxisExtent: 160.0, // 각 아이템의 높이를 지정
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  Widget destinationPage;
                  switch (index) {
                    case 0:
                      destinationPage = VinylPage();
                      break;
                    case 1:
                      destinationPage = PlasticPage();
                      break;
                    case 2:
                      destinationPage = PaperPage();
                      break;
                    case 3:
                      destinationPage = GlassPage();
                      break;
                    case 4:
                      destinationPage = CanPage();
                      break;
                    case 5:
                      destinationPage = StyrofoamPage();
                      break;
                    case 6:
                      destinationPage = FoodPage();
                      break;
                    case 7:
                      destinationPage = EtcPage();
                      break;
                    default:
                      destinationPage = EtcPage();
                  }

                  return Column(
                    children: [
                      SizedBox(height: 0), // 위 여백을 없앰
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => destinationPage),
                          );
                        },
                        child: Material(
                          elevation: 8.0,
                          shadowColor: Color(0xFF6AC99F),
                          borderRadius: BorderRadius.circular(15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: 170.0,
                              height: 110.0,
                              child: Image.asset(
                                gridImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VinylPage()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlasticPage()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaperPage()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GlassPage()),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CanPage()),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StyrofoamPage()),
                              );
                              break;
                            case 6:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodPage()),
                              );
                              break;
                            case 7:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtcPage()),
                              );
                              break;
                            default:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtcPage()),
                              );
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        child: Text(buttonTexts[index]),
                      ),
                      SizedBox(height: 0), // 여백을 0으로 설정
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
