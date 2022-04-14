import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/screens/play.dart';
import 'package:hangman/screens/sidebar.dart';
import 'package:hangman/services/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  SizedBox(
                    width: 180,
                    child: OutlinedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Play",
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
                          "Exit",
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
