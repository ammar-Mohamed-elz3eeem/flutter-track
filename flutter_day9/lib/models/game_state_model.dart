import 'package:flutter_day9/models/category.model.dart';
import 'package:flutter_day9/models/data_model.dart';
import 'package:flutter_day9/models/player_model.dart';

class GameState {
  Player player;
  bool isIn;
  double score;
  dynamic item;

  GameState(this.isIn, this.player, this.score, this.item);
}
