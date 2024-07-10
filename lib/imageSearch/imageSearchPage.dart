import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'camera_result.dart';

class CameraScreen extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  @override
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

  @override
  Widget build(BuildContext context) {
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
        child: ElevatedButton(
          onPressed: () => _takePicture(context), // 카메라 열기
          child: Text('카메라로 찍기'),
        ),
      ),
    );
  }
}
