import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_day9/models/animals_model.dart';
import 'package:flutter_day9/models/category.model.dart';
import 'package:flutter_day9/models/clothes_model.dart';
import 'package:flutter_day9/models/countries_model.dart';
import 'package:flutter_day9/models/famous_model.dart';
import 'package:flutter_day9/models/game_state_model.dart';
import 'package:flutter_day9/models/local_players_mode.dart';
import 'package:flutter_day9/models/player_model.dart';

class GameProvider with ChangeNotifier {
  List<GameState> playerState = [];
  int currentTurn = 0;
  dynamic chosenWord;
  Player? playerOutside;
  Map qA = {};

  void startGame(List<Player> players, Category cat) {
    List<dynamic> data = [];
    switch (cat.type) {
      case Animals:
        data = Animals.instances;
      case Clothes:
        data = Clothes.instances;
      case Countries:
        data = Countries.instances;
      case Famous:
        data = Famous.instances;
      case Players:
        data = Players.instances;
    }
    final rand = Random();
    chosenWord = data[rand.nextInt(data.length)];
    playerState = players
        .map(
          (player) => GameState(true, player, 0, chosenWord),
        )
        .toList();
    playerState[rand.nextInt(playerState.length)].isIn = false;
    playerState.shuffle();
    notifyListeners();
  }

  void moveToNextPlayer() {
    currentTurn = currentTurn + 1;
    notifyListeners();
  }

  void setPlayerOutside() {
    playerOutside =
        playerState.singleWhere((element) => element.isIn == false).player;
  }

  void setQuestions() {
    playerState.shuffle();
    playerState.shuffle();
    for (int i = 0; i < playerState.length - 1; i++) {
      if (playerState[i].isIn == false && i == 0) {
        GameState temp = playerState[i];
        playerState[i] = playerState[playerState.length - 1];
        playerState[playerState.length - 1] = temp;
      }
      qA[playerState[i].player.name] = playerState[i + 1].player.name;
    }
    notifyListeners();
  }

  void playerDoubtSomeone(int doubterId, int doubtedId) {
    if (doubtedId == playerOutside?.id) {
      playerState
          .singleWhere((element) => element.player.id == doubtedId)
          .score += 100;
      notifyListeners();
    }
  }
}
