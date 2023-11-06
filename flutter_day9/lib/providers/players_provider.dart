import 'package:flutter/material.dart';
import 'package:flutter_day9/models/player_model.dart';

class PlayerProvider with ChangeNotifier {
  List<Player> players = [];

  void addPlayer(String playerName, String imagePath) {
    players.add(Player(playerName, imagePath, 0));
    notifyListeners();
  }

  void removePlayer(playerName) {
    players.remove(playerName);
    notifyListeners();
  }

  void updateScore(playerName) {
    players.singleWhere((element) => element.name == playerName).score += 100;
    notifyListeners();
  }
}
