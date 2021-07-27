import 'package:covid_19_awareness/models/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Body()
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.lightbulb,
            ),
          )
        ],
        title: Text(
          "Covid-19 Awareness",
          style: TextStyle(
            fontSize: 20,
          ),
          maxLines: 1,
        ),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.message),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

class Body extends StatelessWidget {
  static List<Map<String,dynamic>> Data=[
  {
  "left": 5.0,
  "bottom": 19.0,
  "height": 85.0,
  "img": "assets/images/covid_19.png",
  "tab": "Slots",
  "Desc": "See how to get covid vaccine",
  "color": Colors.deepPurpleAccent,
  },
    {
      "left": 5.0,
      "bottom": 0.0,
      "height": 160.0,
      "tab": "Virus",
      "Desc": "Know more about the Covid 19",
      "img": "assets/images/virus.png",
      "color": Colors.deepPurpleAccent,
    },
    {
      "img": "assets/images/myths.png",
      "tab": "Myths",
      "left": 30.0,
      "bottom": 1.0,
      "height": 130.0,
      "Desc": "To get the information of covid 19",
      "color": Colors.deepPurpleAccent,
    },
  {
    "left": 20.0,
    "bottom": 9.0,
    "height": 122.0,
    "img": "assets/images/symptoms.png",
  "tab": "Symptoms",
  "Desc": "Covid 19 Symptoms",
  "color": Colors.deepPurpleAccent,
  },
  {
  "img": "assets/images/prevention.png",
    "left": 5.0,
    "bottom": 19.0,
    "height": 122.0,
  "tab": "Precautions",
  "Desc": "How to prevention",
  "color": Colors.deepPurpleAccent,
  },
  ];

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: Data.length,
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index){
      var cat = Data[index];
      return Cardveiw(
        img: cat["img"],
        bottom: cat["bottom"],
        height: cat["height"],
        left: cat["left"],
        Desc: cat["Desc"],
        tab: cat["tab"],
        color: cat["color"],
      );
      },
  );
  }
  }
