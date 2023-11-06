import 'package:flutter/material.dart';
import 'package:flutter_day9/components/custom_radio_button_component.dart';
import 'package:flutter_day9/config/app_theme.dart';
import 'package:flutter_day9/models/category.model.dart';
import 'package:flutter_day9/providers/game_provider.dart';
import 'package:flutter_day9/providers/players_provider.dart';
import 'package:flutter_day9/screens/game_screen.dart';
import 'package:provider/provider.dart';

class Players extends StatelessWidget {
  final Category selectedCat;
  TextEditingController playerName = TextEditingController();
  int avatar = -1;

  Players(this.selectedCat, {super.key});

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
          Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text("أضافة لاعبين"),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Consumer<PlayerProvider>(
                builder: (pContext, value, _) {
                  return SizedBox(
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 500,
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              },
                              itemCount: value.players.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: Image.asset(
                                    value.players[index].imagePath,
                                  ),
                                  leading: Text(value.players[index].name),
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  tileColor: Colors.amber,
                                  style: ListTileStyle.list,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                );
                              },
                            ),
                          ),
                          ListTile(
                            trailing: const Icon(Icons.add),
                            leading: const Text("أضف لاعب جديد"),
                            splashColor: const Color.fromRGBO(255, 193, 7, 1),
                            textColor: Colors.white,
                            tileColor: const Color.fromRGBO(255, 193, 7, 0.4),
                            iconColor: Colors.white,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    height: 300,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: double.maxFinite,
                                          height: 150,
                                          child: CustomRadioButton(
                                            valueChanged: (value) {
                                              avatar = value;
                                            },
                                            selectedValue: 0,
                                          ),
                                        ),
                                        TextField(
                                          controller: playerName,
                                          decoration: const InputDecoration(
                                            label: Text("Player name"),
                                            hintText: "Enter player name",
                                          ),
                                          onEditingComplete: () {
                                            if (avatar > -1 &&
                                                playerName.text.isNotEmpty) {
                                              value.addPlayer(
                                                playerName.text,
                                                "assets/avatars/avatar-$avatar.png",
                                              );
                                            }
                                            print(value.players);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Builder(
                            builder: (context) {
                              if (value.players.length > 2) {
                                return Consumer<GameProvider>(
                                  builder: (context, game, child) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        game.startGame(
                                            value.players, selectedCat);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Game(
                                              p: value.players,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text("يلا بينا"),
                                    );
                                  },
                                );
                              }
                              return Container();
                            },
                          )
                        ],
                      ),
                    ),
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
