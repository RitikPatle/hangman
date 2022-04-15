import 'package:flutter/material.dart';
import 'package:hangman/services/constants.dart';

class Game {
  static int tries = 0;
  static List<String> selectedChar = [];
}

Widget letter(String character, bool hidden) {
  return Container(
    height: 50,
    width: 50,
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: textColor,
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Visibility(
      visible: !hidden,
      child: Center(
        child: Text(
          character,
          style: const TextStyle(
            color: bgColor,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
      ),
    ),
  );
}
