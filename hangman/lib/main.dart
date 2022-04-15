import 'package:flutter/material.dart';
import 'package:hangman/screens/splash.dart';
import 'package:hangman/services/constants.dart';

void main() {
  runApp(const HangmanApp());
}

class HangmanApp extends StatelessWidget {
  const HangmanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
    );
  }
}
