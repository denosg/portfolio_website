import 'package:flutter/material.dart';

class QuestRealmProvider {
  List<String> _photoList = [
    "images/questRealmImg/1.png",
    "images/questRealmImg/2.png",
    "images/questRealmImg/3.png",
    "images/questRealmImg/4.png",
    "images/questRealmImg/5.png",
  ];

  List<String> get photoList {
    return _photoList;
  }
}
