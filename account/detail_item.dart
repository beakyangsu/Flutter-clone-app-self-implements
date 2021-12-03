import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailItem extends StatelessWidget {
  String date;
  String title;
  String money;
  String balance;

  AccountDetailItem(this.date, this.title, this.money, this.balance);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:10.0),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(width:30.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Padding(
                padding:EdgeInsets.only(right: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      money,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    //SizedBox(height: 3.0),
                    Text(
                      balance,
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 11.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(color: Colors.grey.withOpacity(0.3), thickness: 0.5),
          ),
        ],
      ),
    );
  }
}
