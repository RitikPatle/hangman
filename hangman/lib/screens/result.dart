import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/screens/play.dart';
import 'package:hangman/screens/sidebar.dart';
import 'package:hangman/services/appbrain.dart';
import 'package:hangman/services/constants.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key, required this.word}) : super(key: key);
  final String word;

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarBgColor,
        title: const Text(appName),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_open_sharp,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const Sidebar(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text(
                    appName,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                    ),
                  ),
                  Image.asset(
                    "assets/win.png",
                    color: textColor,
                    height: 300,
                    width: 300,
                  ),
                  const Text(
                    "You Won",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Word was ${widget.word}",
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 180,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Restart",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 0.9,
                          color: textColor,
                        ),
                      ),
                      onPressed: () {
                        Game.selectedChar.clear();
                        Game.tries = 0;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 180,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Exit App",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 0.9,
                          color: textColor,
                        ),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
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

class LossScreen extends StatefulWidget {
  const LossScreen({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  State<LossScreen> createState() => _LossScreenState();
}

class _LossScreenState extends State<LossScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: appBarBgColor,
        title: const Text(appName),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_open_sharp,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: const Sidebar(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Text(
                    appName,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 30,
                    ),
                  ),
                  Image.asset(
                    "assets/6.png",
                    color: textColor,
                    height: 280,
                    width: 280,
                  ),
                  const Text(
                    "You Lost",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Word was ${widget.word}",
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 180,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Restart",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 0.9,
                          color: textColor,
                        ),
                      ),
                      onPressed: () {
                        Game.selectedChar.clear();
                        Game.tries = 0;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: 180,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Exit App",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                          ),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 0.9,
                          color: textColor,
                        ),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
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
