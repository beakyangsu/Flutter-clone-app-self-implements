import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/camera/camera_button_style.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

List<CameraDescription> camerasList;
var camera;

// 사용자가 주어진 카메라를 사용하여 사진을 찍을 수 있는 화면
class TakePictureScreen extends StatefulWidget {

  const TakePictureScreen({
    Key key,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {

    super.initState();
    initCamera();
    // 카메라의 현재 출력물을 보여주기 위해 CameraController를 생성합니다.
    _controller = CameraController(
      // 이용 가능한 카메라 목록에서 특정 카메라를 가져옵니다.
      camera,
      // 적용할 해상도를 지정합니다.
      ResolutionPreset.medium,
    );

    // 다음으로 controller를 초기화합니다. 초기화 메서드는 Future를 반환합니다.
    _initializeControllerFuture = _controller.initialize();
  }
  void initCamera() async {
    camerasList = await availableCameras();
    camera = camerasList.first;
    _controller = new CameraController(camerasList[0], ResolutionPreset.medium);
    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // 위젯의 생명주기 종료시 컨트롤러 역시 해제시켜줍니다.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDisable;

    return Scaffold(
      appBar: AppBar(
        title: Text('Take a picture'),
        backgroundColor: Color(0xff343B57),
        foregroundColor: Color(0xFFFFFFFF),
        centerTitle: true,
      ),
      // 카메라 프리뷰를 보여주기 전에 컨트롤러 초기화를 기다려야 합니다. 컨트롤러 초기화가
      // 완료될 때까지 FutureBuilder를 사용하여 로딩 스피너를 보여주세요.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Future가 완료되면, 프리뷰를 보여줍니다.
            return CameraPreview(_controller);
          } else {
            // 그렇지 않다면, 진행 표시기를 보여줍니다.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFE7D251),
        foregroundColor: Color(0xff343B57),
        child: Icon(Icons.camera_alt),
        // onPressed 콜백을 제공합니다.
        onPressed: () async {
          // try / catch 블럭에서 사진을 촬영합니다. 만약 뭔가 잘못된다면 에러에
          // 대응할 수 있습니다.
          try {
            // 카메라 초기화가 완료됐는지 확인합니다.

            await _initializeControllerFuture;


            // path 패키지를 사용하여 이미지가 저장될 경로를 지정합니다.
            final path = join(
              // 본 예제에서는 임시 디렉토리에 이미지를 저장합니다. `path_provider`
              // 플러그인을 사용하여 임시 디렉토리를 찾으세요.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
            print('2');
            // 사진 촬영을 시도하고 저장되는 경로를 로그로 남깁니다.
            await _controller.takePicture(path);
            print('3');
            // 사진을 촬영하면, 새로운 화면으로 넘어갑니다.
            Navigator.pushNamed(
                context,
                '/photo',
                arguments: DisplayPictureScreen(imagePath: path));
          } catch (e) {
            // 만약 에러가 발생하면, 콘솔에 에러 로그를 남깁니다.
            print(e);
          }
        },
      ),
    );
  }
}

// 사용자가 촬영한 사진을 보여주는 위젯
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DisplayPictureScreen dp = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
          title: Text('Display the Picture'),
          backgroundColor: Color(0xff343B57),
          foregroundColor: Color(0xFFFFFFFF),
          centerTitle: true
      ),
      // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
      // 경로로 `Image.file`을 생성하세요.
      body: Column(
        children: [
          Expanded(
            flex: 25,
            child: Image.file(
              File(dp.imagePath),
              fit: BoxFit.cover,
              height:double.infinity,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex:2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CameraButtonStyle(
                    title: Text('Use Image'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
                Container(
                  width: 0.3,
                  height: double.maxFinite,
                  color: Colors.grey,
                ),
                CameraButtonStyle(
                    title: Text('Try Again'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
