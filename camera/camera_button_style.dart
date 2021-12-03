import 'package:flutter/material.dart';

class CameraButtonStyle extends StatelessWidget{
  Text title;
  Function onPressed;
  CameraButtonStyle({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Flexible(
      fit:FlexFit.tight,
      child: Container(
        height: double.maxFinite,
        child: ElevatedButton(
          onPressed: onPressed,
          child: title,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Color(0xff343B57),
            onPrimary: Color(0xFFFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
          ),
        ),
      ),
    );
  }
}
