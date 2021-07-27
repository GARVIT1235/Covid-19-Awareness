import 'package:covid_19_awareness/Pages/HomePage/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/SplashScreenPage/SplashScreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return MaterialApp(
        title: 'Covid_19_Awareness',
        themeMode: ThemeMode.system,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            textTheme: TextTheme(bodyText2: GoogleFonts.quicksand(fontSize: 14.0))
        ),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            textTheme: TextTheme(bodyText2: GoogleFonts.bitter(fontSize: 14.0))
        ),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => SplashPage(),
          '/home' : (BuildContext context) => HomePage(),
        }
    );
  }
}