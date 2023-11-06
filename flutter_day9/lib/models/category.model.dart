import 'package:flutter/material.dart';
import 'package:flutter_day9/models/animals_model.dart';
import 'package:flutter_day9/models/clothes_model.dart';
import 'package:flutter_day9/models/countries_model.dart';
import 'package:flutter_day9/models/famous_model.dart';
import 'package:flutter_day9/models/local_players_mode.dart';

class Category {
  int id;
  String name;
  IconData catIcon;
  List<Category> childern = [];
  Type type;

  Category(this.id, this.name, this.catIcon, this.childern, this.type);

  static List<Category> categories = [
    Category(1, "حيوانات", Icons.bug_report, [], Animals),
    Category(2, "ملابس", Icons.accessibility_new_sharp, [], Clothes),
    Category(3, "دول", Icons.flag, [], Countries),
    Category(4, "مشاهير", Icons.people_outline_sharp, [], Famous),
    Category(
        5,
        "لاعبين",
        Icons.people_outline_sharp,
        [
          Category(6, "لاعبين محليين", Icons.sports_football, [], Players),
          Category(6, "لاعبين دوليين", Icons.sports_football, [], Players),
        ],
        Players),
  ];
}
