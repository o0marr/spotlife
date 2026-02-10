import 'package:flutter/material.dart';

class WelcomeButtom extends StatelessWidget {
  const WelcomeButtom({super.key, this.buttonText});
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(80))
        ),
        child:  Text(
          buttonText!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),

        ),
      ),
    );
  }
}
