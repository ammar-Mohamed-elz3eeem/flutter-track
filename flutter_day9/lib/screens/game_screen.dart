import 'package:flutter/material.dart';
import 'package:flutter_day9/config/app_theme.dart';
import 'package:flutter_day9/models/category.model.dart';
import 'package:flutter_day9/models/player_model.dart';
import 'package:flutter_day9/providers/game_provider.dart';
import 'package:flutter_day9/providers/players_provider.dart';
import 'package:flutter_day9/screens/questions_screen.dart';
import 'package:flutter_day9/screens/scratch_screen.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  final List<Player> p;

  const Game({required this.p, super.key});

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
                  if (value.currentTurn == value.playerState.length) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Column(
                            children: [
                              Text(
                                "جه وقت الاسئلة",
                                style: Theme.of(context).textTheme.displayLarge,
                                textAlign: TextAlign.center,
                              ),
                              const Divider(
                                height: 30,
                                thickness: 1,
                                color: Colors.white,
                              ),
                              Text(
                                "كل لاعب هيسأل لاعب تاني سؤال ويحاول يوقعه",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  value.setQuestions();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Questions(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "يلا بينا عالاسئلة",
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amber,
                        ),
                        child: Text(
                          "ادي الموبايل ل ${value.playerState[value.currentTurn].player.name} خليه يعرف هو جوا ولا برة",
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Scratch(value
                                      .playerState[value.currentTurn].player);
                                },
                              ),
                            );
                          },
                          child: Text("التالي"))
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
