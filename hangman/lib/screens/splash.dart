import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hangman/screens/home.dart';
import 'package:hangman/services/constants.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                appLogo,
                color: textColor,
                height: 300,
                width: 300,
              ),
              const Text(
                appName,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "By Ritik Patle",
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              LoadingAnimationWidget.fourRotatingDots(
                color: textColor,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
