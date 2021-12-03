import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/main/components/account/detail_buttonStyle.dart';
import 'package:kakao_bank/presentation/main/components/account/detail_item.dart';

class AccountDetail extends StatelessWidget {
  Color color;
  String account;
  String balance;

  AccountDetail({this.color, this.account, this.balance});

  @override
  Widget build(BuildContext context) {
    AccountDetail ad = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'My Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
            ),
            Spacer(),
            Text(
              '관리',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        backgroundColor: ad.color,
        foregroundColor: Color(0xFF000000),
        //foregroundColor:
      ),
      body: Column(
        children: [
          Column(
          children: [
              Container(
                color: ad.color,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text(ad.account,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 13.0,
                            color: Color(0xFF000000).withOpacity(0.5),
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        ad.balance,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AccountDetailButton(Text('Transfer')),
                          SizedBox(width: 10.0),
                          AccountDetailButton(Text('Import account')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 5.0),
                  Icon(Icons.search, color: Colors.grey),
                  Spacer(),
                  Text(
                    'Recent History  ',
                    style:TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    AccountDetailItem("11.27", 'friend1', '\$ 30', ad.balance),
                    AccountDetailItem(
                        "11.25", 'Company', '\$ 40.00', ad.balance),
                    AccountDetailItem("11.21", 'friend2', '\$ 20', ad.balance),
                    AccountDetailItem("10.02", 'friend3', '\$ 10', ad.balance),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
