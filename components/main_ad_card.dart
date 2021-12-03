import 'package:flutter/material.dart';
import 'package:kakao_bank/presentation/main/components/LunchUrl.dart';

class MainAdCard extends StatelessWidget {
  final String title;
  final String content;

  MainAdCard({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),*/
      //height: 70,
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            LunchUrl('https://www.youtube.com/watch?v=FfQOeCwY-Oc').launchURL();
          },
          style: ElevatedButton.styleFrom( primary: Colors.white,  onPrimary: Colors.black),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10, top:10),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                      'https://yt3.ggpht.com/a-/AOh14GidBGTEH9UxT-eVgchRp5kISMZYFjSjBAnqWNWr4Q=s100-c-k-c0xffffffff-no-rj-mo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
