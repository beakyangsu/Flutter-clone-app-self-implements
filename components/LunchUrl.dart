import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class LunchUrl {
  final String url;

  LunchUrl(this.url);

  launchURL() async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
