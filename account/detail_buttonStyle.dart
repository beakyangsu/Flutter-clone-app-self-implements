import 'package:flutter/material.dart';

class AccountDetailButton extends StatelessWidget{
  Text title;
  AccountDetailButton(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 150.0,
      child: ElevatedButton(
        onPressed: () {},
        child: title,
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Colors.black.withOpacity(0.1), onPrimary: Colors.black.withOpacity(0.5)),
      ),
    );
  }

}
