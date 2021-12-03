import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/camera/use_camera.dart';

class CameraDialog {

  Dialog({@required title, @required context}){
    showAlertDialog(context, title);
  }
  static void showAlertDialog(BuildContext context, title) async {

    String res = await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Text(
              title,
              textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: Color(0xff343B57),
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'Take a Photo');
                    Navigator.pushNamed(context, '/camera');
                  },
                  child: Text(
                    'Take a Photo',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
