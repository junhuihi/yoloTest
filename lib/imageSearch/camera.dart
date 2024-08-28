import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_vision/flutter_vision.dart';

class YoloImage extends StatefulWidget {
  YoloImage({Key? key}) : super(key: key);

  @override
  State<YoloImage> createState() => _YoloImageState();
}

class _YoloImageState extends State<YoloImage> {
  late FlutterVision vision;
  late List<Map<String, dynamic>> yoloResults;
  File? imageFile;
  int imageHeight = 1;
  int imageWidth = 1;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    vision = FlutterVision();
    loadYoloModel().then((value) {
      setState(() {
        yoloResults = [];
        isLoaded = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    vision.closeYoloModel();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: Text("Model not loaded, waiting for it"),
        ),
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        imageFile != null ? Image.file(imageFile!) : const SizedBox(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: pickImage,
                child: const Text("Pick image"),
              ),
              ElevatedButton(
                onPressed: yoloOnImage,
                child: const Text("Detect"),
              )
            ],
          ),
        ),
        ...displayBoxesAroundRecognizedObjects(size),
      ],
    );
  }

  Future<void> loadYoloModel() async {
    try {
      await vision.loadYoloModel(
        labels: 'assets/classes.txt',
        modelPath: 'assets/model.tflite',
        modelVersion: "yolov5",
        numThreads: 2,
        useGpu: true,
      );
      setState(() {
        isLoaded = true;
      });
    } catch (e) {
      print('Error loading YOLO model: $e');
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
      });
    }
  }

  Future<void> yoloOnImage() async {
    if (imageFile == null) {
      print('No image selected');
      return;
    }

    try {
      yoloResults.clear();
      Uint8List byte = await imageFile!.readAsBytes();
      final image = img.decodeImage(byte);

      if (image == null) {
        print('Error decoding image');
        return;
      }

      // YOLO 모델의 요구 사항에 맞게 이미지 크기 조정
      final resizedImage =
          img.copyResize(image, width: 640, height: 640); // YOLO가 요구하는 크기로 조정
      final resizedBytes = Uint8List.fromList(
          img.encodeJpg(resizedImage, quality: 85)); // JPEG 포맷으로 인코딩

      // YOLO 모델로 이미지 분석
      final result = await vision.yoloOnImage(
        bytesList: resizedBytes,
        imageHeight: 640, // YOLO 모델이 요구하는 높이
        imageWidth: 640, // YOLO 모델이 요구하는 너비
        iouThreshold: 0.8,
        confThreshold: 0.4,
        classThreshold: 0.5,
      );

      if (result.isNotEmpty) {
        setState(() {
          yoloResults = result;
        });
      } else {
        print('No results from YOLO model');
      }
    } catch (e) {
      print('Error during YOLO detection: $e');
    }
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];

    double factorX = screen.width / imageWidth;
    double imgRatio = imageWidth / imageHeight;
    double newWidth = imageWidth * factorX;
    double newHeight = newWidth / imgRatio;
    double factorY = newHeight / imageHeight;

    double pady = (screen.height - newHeight) / 2;

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      return Positioned(
        left: result["box"][0] * factorX,
        top: result["box"][1] * factorY + pady,
        width: (result["box"][2] - result["box"][0]) * factorX,
        height: (result["box"][3] - result["box"][1]) * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }
}
