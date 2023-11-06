import 'package:flutter/material.dart';
import 'package:flutter_day9/config/app_theme.dart';
import 'package:flutter_day9/providers/game_provider.dart';
import 'package:flutter_day9/screens/doubts_screen.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  ValueNotifier<int> index = ValueNotifier(0);

  Questions({super.key});

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
                  return ValueListenableBuilder<int>(
                    valueListenable: index,
                    builder: (context, currentQA, child) {
                      if (currentQA == value.playerState.length - 1) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  "وقت الشكوك",
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                Text(
                                  "كل واحد يختار الشخص اللي هو شاكك فيه ولو الشك طلع في محله هتاخد 100 نقطة",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Doubts(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "بينا عالتصويت",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "${value.qA.keys.toList()[currentQA]} اسئل ${value.qA.values.toList()[currentQA]} وحاول توقعه",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  index.value++;
                                },
                                child: Text(
                                  "التالي",
                                ),
                              )
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
