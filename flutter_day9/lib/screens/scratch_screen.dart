import 'package:flutter/material.dart';
import 'package:flutter_day9/config/app_theme.dart';
import 'package:flutter_day9/models/data_model.dart';
import 'package:flutter_day9/models/player_model.dart';
import 'package:flutter_day9/providers/game_provider.dart';
import 'package:flutter_day9/screens/game_screen.dart';
import 'package:provider/provider.dart';
import 'package:scratcher/scratcher.dart';

class Scratch extends StatelessWidget {
  final Player player;

  const Scratch(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        final player = value.playerState
            .singleWhere((element) => element.player.id == this.player.id);
        final item = player.item as Data;
        return MaterialApp(
          theme: theme(),
          home: Stack(
            children: [
              Image.asset(
                "assets/images/bg.jpg",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Scratcher(
                        brushSize: 10,
                        threshold: 50,
                        color: Colors.red,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 60,
                          height: 60,
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                if (player.isIn) {
                                  return Text(
                                    item.name as String,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  );
                                }
                                return Text(
                                  "برا",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          value.moveToNextPlayer();
                          Navigator.pop(context);
                        },
                        child: Text("التالي"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
