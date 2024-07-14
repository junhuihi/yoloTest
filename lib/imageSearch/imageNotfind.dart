import 'package:flutter/material.dart';

class Imagenotfind extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Imagenotfind();
}

class _Imagenotfind extends State<Imagenotfind> {
  TextEditingController imgName = TextEditingController();

  @override
  void dispose() {
    imgName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF6AC99F),
        title: Text(
          '이미지인식 실패',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 70, 0, 100),
              child: Text(
                '죄송합니다. 이미지 인식에 실패했습니다. \n이용에 불편을 드려 죄송합니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(0),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    width: 400,
                    height: 30,
                    child: TextField(
                      controller: imgName,
                      decoration: InputDecoration(
                          hintText: '어떤 객체인지 설명해주세요. ex)시계',
                          hintStyle: TextStyle(fontSize: 16)),
                    ),
                  ),
                ]))),
            Container(
                width: 330,
                height: 60,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                color: Color(0xFF6AC99F),
                child: TextButton(
                  onPressed: () => {
                    if (imgName.text == '')
                      inputIsNull(context)
                    else
                      BtnPopup(context)
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '관리자에게 전달하기\n',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '해당 이미지는 더 많은 쓰레기를 인식하기 위해 활용됩니다.',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}

//이미지인식 에러 버튼 누르면 뜨는 팝업
void imgError(BuildContext context) {
  TextEditingController imgErrorName = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '이용에 불편을 드려 죄송합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.error, color: Color(0xFF2196F3)),
        content: SingleChildScrollView(
            child: Column(
          children: [
            Text('이미지 인식에 실패했습니다.'),
            Container(
              width: 300,
              height: 30,
            ),
            TextField(
              controller: imgErrorName,
              decoration: InputDecoration(
                  hintText: '올바른 객체 이름을 입력해주세요. ex)시계',
                  hintStyle: TextStyle(fontSize: 16)),
            ),
          ],
        )),
        actions: <Widget>[
          Container(
              width: 330,
              height: 60,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Color(0xFF6AC99F),
              child: TextButton(
                onPressed: () => {
                  if (imgErrorName.text == '')
                    inputIsNull(context)
                  else
                    {Navigator.pop(context), BtnPopup(context)}
                },
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '관리자에게 전달하기\n',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '해당 이미지는 더 많은 쓰레기를 인식하기 위해 활용됩니다.',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )),
        ],
      );
    },
  );
}

//객체 이름 정보 공백일 경우 뜨는 팝업
void inputIsNull(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '내용을 입력해주세요',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.error, color: Color(0xFF2196F3)),
        actions: <Widget>[
          Padding(padding: EdgeInsets.all(0)),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('확인'),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.all(10),
      );
    },
  );
}

//사용자가 이미지랑 객체이름 전송완료 후 뜨는 팝업
void BtnPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          '전송되었습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
        content: Text(
          '감사합니다.',
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}
