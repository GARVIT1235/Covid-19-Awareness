import 'package:covid_19_awareness/Pages/HomePage/Home.dart';
import 'package:covid_19_awareness/services/mythservice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Pages/SplashScreenPage/SplashScreen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 runApp(
  MultiProvider(
      providers: [
        Provider(
      create: (_) => MythService()
  )
  ],
    child: MyApp()
  )
 );
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