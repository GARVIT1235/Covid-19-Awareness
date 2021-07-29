import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covid_19_awareness/services/mythservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget{
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

@override
  Widget build(BuildContext context) {
  MythService catService = Provider.of<MythService>(context, listen: false);
  Future.delayed(Duration(seconds: 4), () async {
    catService.getCategoriesCollectionFromFirebase()
        .then((value) {
      Navigator.of(context).pushReplacementNamed('/home');
    });

  });
    final X = MediaQuery.of(context).size.width;
    final Y = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        padding: EdgeInsets.only(top: Y/3+30),
        height: Y,
        width: X,
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 90,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: Y*.06,
            ),
            AnimatedTextKit(
              animatedTexts:[
                TyperAnimatedText('STAY SAFE',
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
            ),
                    speed: Duration(milliseconds: 200)
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}
