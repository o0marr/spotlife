import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlife/main/auth/register_page.dart';
import 'package:spotlife/main/home/My_Home_Page.dart';
import 'package:spotlife/main/home/music_page.dart';
import 'package:spotlife/main/models/playlist_provider.dart';
import 'package:spotlife/main/themes/dark_mode.dart';
import 'package:spotlife/main/themes/light_mode.dart';
import 'package:spotlife/main/themes/theme_provider.dart';

void main() {
  runApp(
      MultiProvider(providers:
          [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
           ChangeNotifierProvider(create: (context) => PlaylistProvider()),

  ],
  child:const MyApp(),

  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spot',
      debugShowCheckedModeBanner: false,
      theme: Provider
          .of<ThemeProvider>(context)
          .themeData,
      home: MusicPage(),
    );
  }
}

