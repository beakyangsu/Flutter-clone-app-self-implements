import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/main/components/account/detail.dart';
import 'package:flutter/material.dart';

class SavingAccountCard extends StatelessWidget {
  final Color color;
  final String account;
  final String balance;

  const SavingAccountCard({Key key, this.color, this.account, this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/detail',
            arguments: AccountDetail(
              color: color,
              account: account,
              balance: balance,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        width: MediaQuery.of(context).size.width,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Savings Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        account,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 25,
                    color: Colors.black.withOpacity(0.4),
                  )
                ],
              ),
              Text(
                balance,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
