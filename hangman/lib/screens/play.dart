import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hangman/screens/result.dart';
import 'package:hangman/services/appbrain.dart';
import 'package:hangman/services/constants.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  void initState() {
    word = wordsList[random.nextInt(wordsList.length)].toUpperCase();
    checkList = word.split("");
    checkList = checkList.toSet().toList();
    super.initState();
  }

  Random random = Random();

  List checkList = [];
  int completedWords = 0;
  String word = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.heart_broken,
                        color: textColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Remaining Life : ${5 - Game.tries}",
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/${Game.tries}.png",
                    height: 200,
                    width: 200,
                    color: textColor,
                  ),
                  const Text(
                    appName,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: word
                        .split('')
                        .map(
                          (e) => letter(
                            e.toUpperCase(),
                            !Game.selectedChar.contains(e.toUpperCase()),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 250.0,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: alphabets.map((e) {
                        return SizedBox(
                          height: 45,
                          width: 45,
                          child: RawMaterialButton(
                            onPressed: Game.selectedChar.contains(e)
                                ? null // we first check that we didn't selected the button before
                                : () {
                                    setState(() {
                                      Game.selectedChar.add(e);
                                      if (checkList.contains(e)) {
                                        completedWords += 1;
                                        if (completedWords ==
                                            checkList.length) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => WinScreen(
                                                word: word,
                                              ),
                                            ),
                                          );
                                        }
                                      } else {
                                        Game.tries++;
                                        if (Game.tries == 6) {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => LossScreen(
                                                word: word,
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    });
                                  },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Center(
                              child: Text(
                                e,
                                style: const TextStyle(
                                  color: bgColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            fillColor: Game.selectedChar.contains(e)
                                ? Colors.white38
                                : textColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
