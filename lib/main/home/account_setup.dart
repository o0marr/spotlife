import 'package:flutter/material.dart';
import 'package:spotlife/main/home/My_Home_Page.dart';

import '../../core/app_button.dart';
import '../../core/app_image.dart';

class AccountSetup extends StatelessWidget {
  const AccountSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: AppImage(
                    "logo.png",
                    height: 205,
                    width: 173,
                  )),
              SizedBox(
                height: 24,
              ),
              Text(
                "Your account has been set up!\n",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff111827)),
              ),
              Text("We have customized feeds\naccording to your preferences",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff6B7280)),),

              SizedBox(height: 230,),

              AppButton(text:
              "Get Started",
                onPress: () async {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Myhomepage(),));

                },

              )
            ],
          ),
        ),
      ),
    );
  }
}