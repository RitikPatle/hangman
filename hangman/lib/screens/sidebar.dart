import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/screens/about.dart';
import 'package:hangman/screens/home.dart';
import 'package:hangman/screens/play.dart';
import 'package:hangman/services/appbrain.dart';
import 'package:hangman/services/constants.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: bgColor,
            ),
            child: Image.asset(
              appBarLogo,
              color: textColor,
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: textColor,
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: textColor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Game.selectedChar.clear();
              Game.tries = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.play_arrow_outlined,
              color: textColor,
            ),
            title: const Text(
              'play',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
            onTap: () {
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
          ListTile(
            leading: const Icon(
              Icons.android,
              color: textColor,
            ),
            title: const Text(
              'About Me',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: textColor,
            ),
            title: const Text(
              'Exit',
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
            onTap: () => {
              SystemNavigator.pop(),
            },
          ),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
