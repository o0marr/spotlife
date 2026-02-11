import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlife/main/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
         Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
        title: Padding(
        padding: const EdgeInsets.only(left:65),
        child: Text("S E T T I N G S"),
      ),),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode" ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

            CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context , listen: false).isDarkMode,
                onChanged: (value) => Provider.of<ThemeProvider>(context , listen: false).toggleTheme(),)
          ],
        ),
      ),
    );
  }
}
