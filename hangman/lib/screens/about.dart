import 'package:flutter/material.dart';
import 'package:hangman/screens/home.dart';
import 'package:hangman/screens/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hangman/services/constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                    "assets/logo.png",
                    height: 250,
                    width: 250,
                    color: textColor,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    appName,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "By Ritik Patle",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: textColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    child: Container(
                      alignment: Alignment.center,
                      width: 220,
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Visit Ritik's Website",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      launch('https://ritik-patle.web.app/');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 1.0,
                        color: textColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    child: Container(
                      alignment: Alignment.center,
                      width: 220,
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "See Privacy Policy",
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 1.0,
                        color: textColor,
                      ),
                    ),
                    onPressed: () {
                      launch('https://sites.google.com/view/fhangman/home');
                    },
                  ),
                  const SizedBox(height: 15),
                  OutlinedButton(
                    child: Container(
                      alignment: Alignment.center,
                      width: 220,
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        "Back to Home",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 1.0,
                        color: textColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
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
