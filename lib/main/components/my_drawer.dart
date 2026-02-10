import 'package:flutter/material.dart';
import 'package:spotlife/main/auth/account_edit.dart';
import 'package:spotlife/main/auth/register_page.dart';
import 'package:spotlife/main/auth/welcome_screen.dart';
import 'package:spotlife/main/home/music_page.dart';

import '../home/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(child: Center(child: Icon(Icons.music_note,
        size: 40,
          color: Theme.of(context).colorScheme.inversePrimary,
        )
        )),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text("A C C O U N T"),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountEdit(),));
              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text(" H O M E "),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MusicPage(),));
              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text("S e t t i n g s"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
              },

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
              },

            ),
          ),
        ],
      ),
    );
  }
}
