import 'package:flutter/material.dart';
import 'package:flutter_day9/components/custom_radio_selection_component.dart';
import 'package:flutter_day9/config/app_theme.dart';
import 'package:flutter_day9/providers/game_provider.dart';
import 'package:provider/provider.dart';

class Doubts extends StatelessWidget {
  ValueNotifier<int> index = ValueNotifier(0);

  Doubts({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Consumer<GameProvider>(
                builder: (context, value, child) {
                  return ValueListenableBuilder(
                    valueListenable: index,
                    builder: (context, doubtsIdx, child) {
                      final currentPlayers =
                          value.playerState.map((e) => e.player).toList();
                      if (index.value == currentPlayers.length - 1) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text("السهن هو"),
                              ],
                            ),
                          ),
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        height: 500,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text(
                                "${value.playerState[doubtsIdx].player.name} اختار انت شاكك في مين",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              CustomRadioSelection(
                                  players: currentPlayers,
                                  valueChanged: (newValue) {
                                    value.playerDoubtSomeone(
                                      currentPlayers[doubtsIdx].id,
                                      currentPlayers[newValue].id,
                                    );
                                    index.value++;
                                  },
                                  numberOfChoices: currentPlayers.length - 1)
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
