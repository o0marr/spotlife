import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:spotlife/main/auth/account_edit.dart';
import 'package:spotlife/main/auth/welcome_screen.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "P R O F I L E",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AccountEdit(),
            ),
          );
        },icon: Icon(Icons.arrow_back),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage("assets/img/7s.jpg")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.amberAccent),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 80,),
              Form(child:
              Column(
               children: [
                 TextFormField(
                   decoration:  InputDecoration(label: Text("Full Name"), prefixIcon: Icon(Icons.person),hintStyle: const TextStyle(color: Colors.black26),
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),),
                 ),
                 SizedBox(height: 20,),
                 TextFormField(
                   decoration: InputDecoration(label: const Text("E-Mail"), prefixIcon: const Icon(Icons.mail_outline_sharp),hintStyle: const TextStyle(color: Colors.black26),
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),),

                 ),
                 SizedBox(height: 20,),
                 TextFormField(
                   decoration:  InputDecoration(label: Text("Phone No."), prefixIcon: Icon(Icons.phone),hintStyle: const TextStyle(color: Colors.black26),
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),),
                 ),
                 SizedBox(height: 20,),
                 TextFormField(
                   decoration:  InputDecoration(label: Text("Password"), prefixIcon: Icon(Icons.fingerprint_outlined),hintStyle: const TextStyle(color: Colors.black26),
                     border: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black12),
                       borderRadius: BorderRadius.circular(100),
                     ),),
                 ),
                 SizedBox(height: 30,),

                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(onPressed: () {
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                       builder: (context) => AccountEdit(),
                     ),
                             (route) => false,);
                   },
                       style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent,side: BorderSide.none,shape: StadiumBorder()),
                       child: Text("Done",style: TextStyle(color: Colors.black),)),
                 ),
                 const SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text.rich(
                       TextSpan(
                         text: "Joined ",
                         style: TextStyle(fontSize: 12),
                         children: [
                           TextSpan(
                             text: "11/2/2026",
                             style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)
                           )
                         ]
                       )
                     ),
                     ElevatedButton(onPressed: () {
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                         builder: (context) => WelcomeScreen(),
                       ),
                             (route) => false,);
                     },
                         style: ElevatedButton.styleFrom(backgroundColor: Colors.red.withOpacity(0.1),
                         elevation: 0,
                           foregroundColor: Colors.red,
                           shape: const StadiumBorder(),
                           side: BorderSide.none,
                         ),
                         child: const Text("Delete"),

                     )
                   ],
                 )


               ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
