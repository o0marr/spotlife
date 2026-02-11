import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
   CustomScaffold({super.key, this.child});

  final Widget? child;
  bool BackIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(

        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
          backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/img/bk.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(child: child!),
        ],
      ),
    );
  }
}
