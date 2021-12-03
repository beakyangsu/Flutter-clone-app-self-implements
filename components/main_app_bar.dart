import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/main/components/LunchUrl.dart';


class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Text(
            'Yangsu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2B3044),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'My Account',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.transparent,
                child: IconButton(
                    color: Colors.blue,
                    iconSize: 30.0,
                    icon: Icon(Icons.play_circle_fill),
                    onPressed: () => LunchUrl(
                            'https://github.com/PuzzleLeaf/flutter_kakao_bank_ui_clone')
                        .launchURL()),
              ),
              Text(
                'go to github reference!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
