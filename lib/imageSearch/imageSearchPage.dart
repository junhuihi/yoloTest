import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'camera_result.dart';

class CameraScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePicture(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraResultPage(imagePath: pickedFile.path),
        ),
      );
    }
  }

  Future<void> _pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraResultPage(imagePath: pickedFile.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = 200.0; // 버튼 길이 수정
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF6AC99F),
        title: Text(
          '이미지로 검색',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40, // 버튼의 높이 설정
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () => _takePicture(context), // 카메라 열기
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.white),
                    SizedBox(width: 4), // 아이콘과 텍스트 사이 간격
                    Expanded(
                      child: Text(
                        '카메라 촬영하기',
                        textAlign: TextAlign.center, // 텍스트 가운데 정렬
                        style: TextStyle(
                          color: Colors.white, // 글자 색깔 흰색
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6AC99F), // 버튼 배경색 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 사각형 모양
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // 버튼 사이 간격
            Container(
              height: 40, // 버튼의 높이 설정
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () => _pickImage(context), // 이미지 가져오기
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 아이콘 왼쪽 정렬
                  children: [
                    Icon(Icons.photo, color: Colors.white),
                    SizedBox(width: 4), // 아이콘과 텍스트 사이 간격
                    Expanded(
                      child: Text(
                        '이미지 가져오기',
                        textAlign: TextAlign.center, // 텍스트 가운데 정렬
                        style: TextStyle(
                          color: Colors.white, // 글자 색 흰색
                        ),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6AC99F), // 버튼 배경색 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // 사각형 모양
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
