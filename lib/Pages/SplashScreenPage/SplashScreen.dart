import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget{
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2) , (){Navigator.of(context).pushReplacementNamed("/home");});
  }

  @override
  Widget build(BuildContext context) {
    final X = MediaQuery
        .of(context)
        .size
        .width;
    final Y = MediaQuery
        .of(context)
        .size
        .height;
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
